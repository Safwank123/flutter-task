import 'package:flutter/material.dart';
import 'package:flutter_assessment/screens/home_sceen.dart';
import 'package:flutter_assessment/screens/register_screen.dart';
import 'package:flutter_assessment/widgets/custom_password_textfeild.dart';
import 'package:flutter_assessment/widgets/custom_email_textfeild.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

 
  Future<void> _loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');
    if (savedEmail != null) {
      _emailController.text = savedEmail;
    }
    if (savedPassword != null) {
      _passwordController.text = savedPassword;
    }
  }

  @override
  void initState() {
    super.initState();
    _loadCredentials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              height: 350,
              width: double.infinity,
              child: Stack(
                children: [
                  Positioned(
                    top: -140,
                    left: -30,
                    right: -40,
                    child: CircleAvatar(
                      radius: 240,
                      backgroundImage: AssetImage('assets/login_image.png'),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomEmailTextField(
              label: 'Email',
              hintText: 'Write Your Email',
              controller: _emailController,
            ),
            SizedBox(
              height: 20,
            ),
            CustomPasswordTextField(
              label: 'Password',
              hintText: 'Write Your Password',
              controller: _passwordController,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 190, top: 10),
              child: Text(
                'Forget Your Password?',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 60,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: GestureDetector(
                 onTap: () async {
  if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');

   
    if (_emailController.text == savedEmail && _passwordController.text == savedPassword) {
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeSceen()),
      );
    } else {
     
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect email or password')),
      );
    }
  } else {
  
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Please enter both email and password')),
    );
  }
}
,
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Or Continue with',
              style: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.facebook,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Facebook')
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: 170,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          'assets/google_icon.png',
                          height: 20,
                          width: 20,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Google')
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'You don\'t have an account?',
                  style: TextStyle(fontSize: 15),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterScreen()),
                    );
                  },
                  child: Text(
                    'Sign up?',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
