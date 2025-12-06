import 'package:flutter/material.dart';

// Màu sắc tùy chỉnh theo thiết kế của bạn
const Color primaryColor = Color(0xFF445DFF); // Màu xanh dương đậm
const Color accentColor = Color(0xFF00FF00); // Màu xanh neon
const Color backgroundColor = Color(0xFFD9D9D9); // Màu nền xám nhạt

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Màu nền chung cho cả màn hình
      backgroundColor: backgroundColor,

      // Thanh điều hướng dưới cùng (Bottom Navigation Bar)
      bottomNavigationBar: _buildBottomNavBar(),

      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // 1. Phần Header (Màu Xanh Dương)
            _buildHeader(context),

            // 2. Nội dung chính nằm trên nền trắng/xám
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Khoảng cách giữa Header và các Nút Chức năng
                  const SizedBox(height: 16),

                  // 3. Các Nút Chức năng (Việc nhà, Chi tiêu, Cân đối nợ)
                  const FeatureButtons(),

                  const SizedBox(height: 24),

                  // 4. Thẻ Thống kê Chi tiêu
                  const StatsCard(),

                  const SizedBox(height: 24),

                  // 5. Thẻ Bảng tin (Thông báo)
                  const NewsFeedCard(),

                  const SizedBox(height: 24),

                  // 6. Danh sách Công việc nhà
                  const TaskList(),

                  const SizedBox(height: 100), // Khoảng trống cho Bottom Nav Bar
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget: Bottom Navigation Bar ---
  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          // 1. TRANG CHỦ
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home/home.png',
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              'assets/home/home.png',
              height: 24,
              color: primaryColor,
            ),
            label: 'Trang Chủ',
          ),

          // 2. CHI TIÊU
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home/wallet.png',
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              'assets/home/wallet.png',
              height: 24,
              color: primaryColor,
            ),
            label: 'Chi Tiêu',
          ),

          // 3. CHAT
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home/chat.png',
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              'assets/home/chat.png',
              height: 24,
              color: primaryColor,
            ),
            label: 'Chat',
          ),

          // 4. CÀI ĐẶT
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home/setting.png',
              height: 24,
              color: Colors.grey,
            ),
            activeIcon: Image.asset(
              'assets/home/setting.png',
              height: 24,
              color: primaryColor,
            ),
            label: 'Cài Đặt',
          ),
        ],
      ),
    );
  }
}

// --- Widget Con: Header và Thanh Tìm kiếm ---
Widget _buildHeader(BuildContext context) {
  // Lấy chiều cao màn hình để tạo hình cong
  final double screenHeight = MediaQuery.of(context).size.height;
  return Container(
    // Chiều cao có thể thay đổi tùy thuộc vào nội dung
    height: screenHeight * 0.35,
    width: double.infinity,
    decoration: BoxDecoration(
      color: primaryColor,
      // Tạo hiệu ứng cong ở dưới
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(50),
      ),
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Top Bar (Tên Trang, Avatar, Chuông)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trang chủ',
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.notifications_none, color: Colors.white, size: 28),
              ],
            ),

            const SizedBox(height: 16),

            // Profile Info
            const Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/home/avt.png'),
                  backgroundColor: Colors.orange, // Màu nền dự phòng
                ),
                SizedBox(width: 8),
                Text(
                  'Chào mừng, Đạt!',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Câu hỏi
            const Text(
              'Nhớ hôm nay bạn cần làm gì chứ?',
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),

            // Thanh Tìm kiếm
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                hintText: 'Tìm kiếm ...',
                filled: true,
                fillColor: Colors.white.withOpacity(0.9),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

// --- Widget Con: Các Nút Chức năng (Việc nhà, Chi tiêu, Cân đối nợ) ---
class FeatureButtons extends StatelessWidget {
  const FeatureButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildFeatureItem('assets/home/dondep.png', 'Việc nhà'),
        _buildFeatureItem('assets/home/money.png', 'Thêm Chi Tiêu'),
        _buildFeatureItem('assets/home/no.png', 'Cân đối nợ'),
      ],
    );
  }

  Widget _buildFeatureItem(String imagePath, String label) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ],
          ),
          // ✅ THAY THẾ Icon BẰNG Image.asset
          child: Padding(
            padding: const EdgeInsets.all(16.0), // Thêm padding cho ảnh nhỏ lại
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain, // Đảm bảo ảnh vừa vặn trong Container
              color: primaryColor, // Nếu bạn muốn tô màu cho ảnh
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

// --- Widget Con: Thẻ Thống kê Chi tiêu ---
class StatsCard extends StatelessWidget {
  const StatsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tuần này phòng bạn đã chi',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 4),
              const Text(
                '2.000.000đ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Thanh tiến trình (Progress Bar)
              Container(
                width: 150,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.75, // 75%
                  child: Container(
                    decoration: BoxDecoration(
                      color: accentColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Vòng tròn Tiến trình (Circle Progress Indicator)
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 70,
                height: 70,
                child: CircularProgressIndicator(
                  value: 0.75, // 75%
                  strokeWidth: 8,
                  backgroundColor: Colors.grey.shade200,
                  valueColor: const AlwaysStoppedAnimation<Color>(accentColor),
                ),
              ),
              const Text(
                '75%',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// --- Widget Con: Thẻ Bảng tin ---
class NewsFeedCard extends StatelessWidget {
  const NewsFeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bảng tin',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            'Hiện không có thông báo gì',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          // Bạn có thể thêm ListView.builder cho các thông báo thực tế tại đây
        ],
      ),
    );
  }
}

// --- Widget Con: Danh sách Công việc nhà ---
class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu mẫu
    final List<Map<String, dynamic>> tasks = [
      {'name': 'Quét dọn nhà cửa', 'done': true},
      {'name': 'Giặt đồ', 'done': true},
      {'name': 'Rửa bát', 'done': false},
      // Thêm các công việc khác nếu cần
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Việc nhà cần làm hôm nay',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Hôm nay là ngày làm việc của: Đạt Đỗ',
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          // Danh sách công việc
          ...tasks.asMap().entries.map((entry) {
            int index = entry.key;
            Map<String, dynamic> task = entry.value;
            return _buildTaskItem(
              context,
              '${index + 1}. ${task['name']}',
              task['done'],
            );
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildTaskItem(BuildContext context, String taskName, bool isDone) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Icon Checkbox
              Icon(
                isDone ? Icons.check_box : Icons.check_box_outline_blank,
                color: isDone ? accentColor : Colors.grey,
                size: 24,
              ),
              const SizedBox(width: 8),
              Text(
                taskName,
                style: TextStyle(
                  decoration: isDone ? TextDecoration.lineThrough : null,
                  color: isDone ? Colors.grey : Colors.black,
                ),
              ),
            ],
          ),
          // Checkbox cuối cùng (nếu muốn)
          Checkbox(
            value: isDone,
            onChanged: (bool? newValue) {
              // TODO: Xử lý thay đổi trạng thái công việc
              print('Trạng thái ${taskName} thay đổi thành: $newValue');
            },
            activeColor: accentColor,
            checkColor: Colors.black,
          ),
        ],
      ),
    );
  }
}