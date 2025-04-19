import 'package:flutter/material.dart';
import 'package:my_app/src/widgets/company/ownership_structure.dart';
import 'package:readmore/readmore.dart';

class CompanyOverviewScreen extends StatelessWidget {
  const CompanyOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 5,
      children: [
        Image.network(
          'https://picsum.photos/400/150',
          fit: BoxFit.cover,
          height: 150,
        ),
        // Ten and Description
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Text("Ngân hàng thương mại cổ phần Á Châu",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              ReadMoreText(
                "ACB là  một trong những ngân hàng thương mại cổ phần hàng đầu tại Việt Nam,"
                " với hệ thống mạng lưới chi nhánh rộng khắp nơi và hơn 9000 nhân viên làm việc, "
                "với nhiều loại hình sản phẩm, dịch vụ đa dạng",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                ),
                trimMode: TrimMode.Line,
                trimLines: 3,
                trimCollapsedText: ' Xem thêm',
                trimExpandedText: '\nThu gọn',
                lessStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                moreStyle: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              )
            ],
          ),
        ),
        // Thong tin chi tiet
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Thông tin cơ bản",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Text(
                "Loại hình: Ngân hàng thương mại",
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
              ),
              Text(
                "Website: https://www.acb.com.vn/",
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
              ),
              Text(
                "Địa chỉ: 442 Nguyễn Thị Minh Khai, Phường 5, Quận 3, TP.HCM",
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
              ),
              Text(
                "Điện thoại: 028 3829 9999",
                style: TextStyle(
                  fontSize: 12.5,
                  color: Colors.black,
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 1,
              )
            ],
          ),
        ),
        // Chi so tai chinh
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            spacing: 3,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Chỉ số tài chính",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "P/E",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "6.93",
                    style: TextStyle(fontSize: 12.5, color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "P/B",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "1.39",
                    style: TextStyle(fontSize: 12.5, color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Vốn hóa",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "116,356.44",
                    style: TextStyle(fontSize: 12.5, color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ESP Cơ bản",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "3.76",
                    style: TextStyle(fontSize: 12.5, color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ESP pha loãng",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "3.76",
                    style: TextStyle(fontSize: 12.5, color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tỷ lệ % room NN",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "0.00",
                    style: TextStyle(fontSize: 12.5, color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 0.3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Giá trị sổ sách",
                    style: TextStyle(
                      fontSize: 12.5,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "18.69",
                    style: TextStyle(fontSize: 12.5, color: Colors.black, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                color: Colors.black54,
                thickness: 0.3,
              ),
            ],
          ),
        ),

        // Co cau so huu
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Cơ cấu sở hữu",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: OwnershipStructure(),
              )
            ],
          ),
        )
      ],
    ));
  }
}
