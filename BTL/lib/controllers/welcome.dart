import 'package:flutter/material.dart';
import 'package:btl/views/dangki.dart';
import 'package:btl/views/dangnhap.dart';

// Giả sử bạn đã thêm hình ảnh vào thư mục 'assets/images/house.png'
// và đã khai báo trong pubspec.yaml.
const String _imagePath = 'assets/welcome/house.png';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình để định vị
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            // Căn chỉnh nội dung ở giữa theo chiều dọc
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Expanded(
            flex: 3,
            child: Center(
              child: Image.asset('assets/welcome/house.png', // Thay thế bằng đường dẫn ảnh của bạn
              height: screenHeight * 0.2, // Khoảng 20% chiều cao màn hình
            ),
          ),
        ),

        // 2. Tên ứng dụng
        const Text(
          'RoomMate Pro',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),

        // 3. Thông điệp chào mừng
        const SizedBox(height: 10),
        const Text(
          'chào mừng bạn!',
          style: TextStyle(
            fontSize: 12,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          'dễ dàng quản lý trọ bạn mọi lúc, mọi nơi!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            color: Colors.black45,
          ),
        ),

        // Khoảng cách lớn trước nút
        Expanded(
          flex: 1,
          child: Container(),
        ),

        // 4. Nút Đăng Ký Ngay
        SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const RegistrationScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lime, // Màu xanh neon
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 5,
            ),
            child: const Text(
              'Đăng Kí Ngay',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // 5. Link Đăng Nhập
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
          child: RichText(
            text: const TextSpan(
              text: 'Bạn đã có tài khoản? ',
              style: TextStyle(
                color: Colors.black87,
                fontSize: 14,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Đăng Nhập',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Khoảng cách
        const SizedBox(height: 50),

        // 6. Hoặc tiếp tục với
        const Text(
          'hoặc tiếp tục với',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),

        // 7. Icon Facebook và Google
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon Facebook
            IconButton(
              icon: Image.asset('assets/welcome/db.png',height: 40,),
              onPressed:(){
                print('Facebook được nhấn');
              },
            ),

            const SizedBox(width: 15),

            // Icon Google
            IconButton(
                onPressed: (){
                  print('Google được nhấn');
                },
                icon: Image.asset('assets/welcome/gg.webp',height: 40,),
            )
          ],
        ),

        // Khoảng cách dưới cùng
        const SizedBox(height: 30),
        ],
      ),
    ),
    ),
    );
  }
}

// Widget phụ cho các nút mạng xã hội
class _SocialIconButton extends StatelessWidget {
  final String icon;
  final Color color;
  final VoidCallback onTap;

  const _SocialIconButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300, width: 1),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          // Trong thực tế, bạn sẽ dùng Image.asset(icon)
          // Tạm thời dùng Icon Placeholder để mô phỏng
          child: Icon(
            icon.contains('facebook') ? Icons.facebook : Icons.g_mobiledata,
            color: color,
            size: 35,
          ),
        ),
      ),
    );
  }
}