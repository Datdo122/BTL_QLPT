import 'package:flutter/material.dart';
import 'package:btl/views/dangnhap.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sử dụng Scaffold làm nền tảng cho màn hình
    return Scaffold(
      body: SafeArea(
        // Đảm bảo nội dung không bị che bởi thanh trạng thái
        child: SingleChildScrollView(
          // Cho phép cuộn khi bàn phím hiện lên hoặc nội dung dài
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 1. Icon Back (Quay lại)
              IconButton(
                icon: Image.asset('assets/login/back.png', height: 30,),
                onPressed: () {
                  // TODO: Xử lý quay lại màn hình trước
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 16),

              // 2. Tiêu đề và Mô tả
              const Text(
                'Tạo tài khoản',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'tạo tài khoản để bắt đầu sử dụng!',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 32),

              // 3. Form Đăng ký
              _buildRegistrationForm(),
              const SizedBox(height: 32),

              // 4. Nút Đăng Ký Tài Khoản
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Xử lý logic đăng ký tài khoản và validation
                    print('Đăng Ký Tài Khoản clicked');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreenAccent.shade700, // Màu xanh neon
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Đăng Kí Tài Khoản',
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 5. Hoặc tiếp tục với
              Center(
                child: Text(
                  'hoặc tiếp tục với',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              const SizedBox(height: 16),

              // 6. Icon FB và GG
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
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
              const SizedBox(height: 32),

              // 7. Liên kết Đăng Nhập
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  },
                  child: RichText(
                    text: TextSpan(
                      text: 'Bạn đã có tài khoản? ',
                      style: TextStyle(color: Colors.grey[800], fontSize: 16),
                      children: const <TextSpan>[
                        TextSpan(
                          text: 'Đăng Nhập.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue, // Màu xanh nổi bật
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Widget Con: Form Đăng Ký ---
  Widget _buildRegistrationForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Họ và Tên
        _buildTextFieldWithLabel('Họ và Tên', Icons.person_outline, 'Nhập họ và tên của bạn.'),
        // Số điện thoại
        _buildTextFieldWithLabel('Số điện thoại', Icons.phone_outlined, 'Nhập số điện thoại của bạn.', keyboardType: TextInputType.phone),
        // Email
        _buildTextFieldWithLabel('Email', Icons.email_outlined, 'Nhập email của bạn.', keyboardType: TextInputType.emailAddress),
        // Mật khẩu
        _buildTextFieldWithLabel('Mật khẩu', Icons.lock_outline, 'Nhập mật khẩu.', isPassword: true),
        // Nhập lại mật khẩu
        _buildTextFieldWithLabel('Nhập lại mật khẩu', Icons.lock_outline, 'Nhập lại mật khẩu.', isPassword: true),
      ],
    );
  }

  // --- Hàm hỗ trợ tạo TextFormField với label và style giống hình ---
  Widget _buildTextFieldWithLabel(
      String label,
      IconData icon,
      String hintText, {
        TextInputType keyboardType = TextInputType.text,
        bool isPassword = false,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextFormField(
            keyboardType: keyboardType,
            obscureText: isPassword,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: Colors.grey),
              hintText: hintText,
              hintStyle: const TextStyle(color: Colors.grey),
              // Màu nền xám nhạt và border không viền
              filled: true,
              fillColor: Colors.grey.shade200,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
            // TODO: Thêm validator tại đây
          ),
        ],
      ),
    );
  }
}

// --- Widget Con: Social IconButton ---
class SocialIconButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback? onTap;

  const SocialIconButton({
    required this.icon,
    required this.color,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Center(
          // Dùng Image.asset/Network cho icon FB/GG thực tế nếu không dùng icons Flutter
          child: Icon(
            icon,
            color: color,
            size: 30,
          ),
        ),
      ),
    );
  }
}