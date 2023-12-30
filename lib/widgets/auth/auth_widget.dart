import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:themoviedb/widgets/main_screen/main_screen_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Login to your account",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [_HeaderWidget()],
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  final textStyle = const TextStyle(fontSize: 16, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25,),
          _FormWidget(),
          const SizedBox(height: 25,),
          Text(
            "To use the TMDB rating editing and features, as well as to receive personal recommendations, you need to log in to your account. If you don't have an account, registering it is free and easy. Click here to get started.",
            style: textStyle,
          ),
          const SizedBox(height: 5,),
          TextButton(
              onPressed: (){},
              style: AppButtonStyle.linkButton,
              child: Text("Register")
          ),
          const SizedBox(height: 25,),
          Text(
            "If you have registered but have not received a confirmation email, click here to resend the email.",
            style: textStyle,
          ),
          const SizedBox(height: 5,),
          TextButton(
              onPressed: (){},
              style: AppButtonStyle.linkButton,
              child: Text("Verifivation email"),
          ),
        ],
      ),
    );
  }
}

class _FormWidget extends StatefulWidget {
  const _FormWidget({super.key});


  @override
  State<_FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController(text: "admin");
  final _passwordTextController = TextEditingController(text: "admin");
  String? errorText = null;
  void _auth(){
    final login = _loginTextController.text;
    final pass = _passwordTextController.text;

    if(login == 'admin' && pass == "admin"){
      errorText = null;
      Navigator.of(context).pushReplacementNamed('/main_screen');
    }else{
      errorText = "Неверный логин или пароль";
    }
    setState(() {

    });
  }
  void _resetPassword(){
    print("reset Password");
  }
  @override
  Widget build(BuildContext context) {
    const color = Color(0xFF01B4E4);
    const textStyle = TextStyle(
      fontSize: 16,
      color: Color(0xFF212529),
    );
    const textFieldDecorator =
    InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      isCollapsed: true,
    );

    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(
              fontSize: 17,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 20,),
        ],
        const Text(
          "Username",
          style: textStyle,
        ),
        const SizedBox(height: 5,),
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
        ),
        const SizedBox(height: 20,),
        const Text(
          "Password",
          style: textStyle,
        ),
        const SizedBox(height: 5,),
        TextField(
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(height: 25,),
        Row(
          children: [
            ElevatedButton(
                onPressed: _auth,
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(color),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                  ),
                  padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                  ),
                ),
                child: Text("Login")
            ),
            const SizedBox(width: 20,),
            TextButton(
                onPressed: _resetPassword,
                style: AppButtonStyle.linkButton,
                child: const Text("Reset password")
            )
          ],
        )
      ],
    );
  }
}
