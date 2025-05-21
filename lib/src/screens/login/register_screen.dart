import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/src/blocs/auth/auth/auth_bloc.dart';
import 'package:my_app/src/blocs/file/file_bloc.dart';
import 'package:my_app/src/models/auth/request/register_request.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  DateTime? selectedDate;
  PlatformFile? _selectedFile;

  @override
  void dispose() {
    usernameController.dispose();
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() => _selectedFile = result.files.first);
    }
  }

  void _submit() {
    if (_selectedFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select an image.")));
      return;
    }
    context.read<FileBloc>().add(FileUploadRequested(file: _selectedFile!));
  }

  void _showDatePicker() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SfDateRangePicker(
          onSelectionChanged: (args) {
            setState(() => selectedDate = args.value);
            Navigator.pop(context);
          },
          selectionMode: DateRangePickerSelectionMode.single,
          initialSelectedDate: selectedDate ?? DateTime(2000),
          maxDate: DateTime.now(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<FileBloc, FileState>(
          listener: (context, state) {
            if (state is FileUploadSuccess) {
              context.read<AuthBloc>().add(RegisterRequested(
                    registerRequest: RegisterRequest(
                      fullName: fullNameController.text,
                      userName: usernameController.text,
                      email: emailController.text,
                      password: passwordController.text,
                      avatarUrl: state.filePath,
                      birthDay: selectedDate ?? DateTime.now(),
                    ),
                  ));
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pop(context);
            } else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
        ),
      ],
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 3,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Create", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    const Text("Account", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                Row(
                  children: [
                    GestureDetector(
                      onTap: _pickFile,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: _selectedFile != null ? FileImage(File(_selectedFile!.path!)) : const AssetImage("assets/images/profile.jpg") as ImageProvider,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(child: _buildTextField(fullNameController, "Full Name")),
                  ],
                ),
                const SizedBox(height: 10),
                _buildTextField(usernameController, "Username"),
                const SizedBox(height: 10),
                _buildTextField(emailController, "Email", inputType: TextInputType.emailAddress),
                const SizedBox(height: 10),
                _buildTextField(passwordController, "Password", isPassword: true),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _showDatePicker,
                  child: AbsorbPointer(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: selectedDate != null ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}" : "Select birthday",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
                        contentPadding: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text("By signing up, you agree to our Terms of Service and Privacy Policy.", style: TextStyle(fontSize: 11)),
                const SizedBox(height: 10),
                BlocBuilder<AuthBloc, AuthState>(builder: (context, authState) {
                  final isLoading = authState is AuthLoading || context.watch<FileBloc>().state is FileLoading;
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: isLoading ? const CircularProgressIndicator(color: Colors.white) : const Text("Sign Up", style: TextStyle(color: Colors.white)),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint, {bool isPassword = false, TextInputType inputType = TextInputType.text}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hint,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
