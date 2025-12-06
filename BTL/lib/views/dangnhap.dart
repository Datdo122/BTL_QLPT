import 'package:flutter/material.dart';
import 'package:btl/views/dangki.dart';

// --- Màn hình Đích Giả lập ---
// Màn hình sẽ được điều hướng đến
class SimpleDestinationScreen extends StatelessWidget {
  final String title;
  const SimpleDestinationScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(
          'Đây là màn hình: $title',
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
// ------------------------------

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Hàm xử lý logic Đăng nhập (chỉ điều hướng)
  void _handleLogin() {
    // Chỉ kiểm tra rỗng cơ bản
    if (_formKey.currentState!.validate()) {
      // Khi nhấn Đăng Nhập thành công (giả định), chuyển sang màn hình Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const SimpleDestinationScreen(title: 'Home (Đăng nhập thành công)'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Nút Quay Lại
              const SizedBox(height: 40),
              IconButton(
                icon: Image.asset('assets/login/back.png', height: 30,),
                onPressed: () {
                  // TODO: Xử lý quay lại màn hình trước
                  Navigator.pop(context);
                },
              ),

              // ... (Phần tiêu đề và trường nhập liệu giống như code trước) ...
              const SizedBox(height: 30),
              const Text(
                'Đăng nhập tài khoản',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 8),
              const Text(
                'đăng nhập tài khoản để bắt đầu sử dụng!',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 40),

              // Trường Số điện thoại
              const Text('Số điện thoại', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildInputField(
                controller: _phoneController,
                hintText: 'Nhập số điện thoại của bạn',
                icon: Icons.phone_android,
                isNumber: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập số điện thoại';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Trường Mật khẩu
              const Text('Mật khẩu', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              _buildInputField(
                controller: _passwordController,
                hintText: 'Nhập mật khẩu',
                icon: Icons.lock_outline,
                isPassword: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),


              // 2. Nút Quên mật khẩu
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Điều hướng đến màn hình Quên mật khẩu
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SimpleDestinationScreen(title: 'Quên Mật Khẩu'),
                      ),
                    );
                  },
                  child: const Text(
                    'Bạn quên mật khẩu?',
                    style: TextStyle(color: Color(0xFF445DFF)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 3. Nút Đăng Nhập
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: _handleLogin, // Gọi hàm _handleLogin đã chỉnh sửa
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00FF00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Đăng Nhập',
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              // 4. Link Đăng ký
              Center(
                child: TextButton(
                  onPressed: () {
                    // Điều hướng đến màn hình Đăng ký
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegistrationScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Bạn chưa có tài khoản?',
                    style: TextStyle(color: Color(0xFF445DFF), fontSize: 16),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // 5. Đăng nhập với Mạng xã hội
              const Center(
                child: Text(
                  'hoặc tiếp tục với',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),

              const SizedBox(height: 20),

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
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper cho các trường nhập liệu
  Widget _buildInputField({
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
    bool isPassword = false,
    bool isNumber = false,
    String? Function(String?)? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEBEBEB),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        keyboardType: isNumber ? TextInputType.phone : TextInputType.text,
        validator: validator,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color(0xFFAAAAAA)),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
          prefixIcon: Icon(icon, color: const Color(0xFF888888)),
        ),
      ),
    );
  }

  // Widget helper cho các nút mạng xã hội (Sử dụng Icon thay vì Image Asset)
  Widget _buildSocialButton(IconData icon, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Icon(icon, size: 35),
          // Nếu muốn sử dụng logo thật: thay thế bằng Image.asset(...)
        ),
      ),
    );
  }
}