[12:49, 9/29/2026] Allison: name: izihirwe
description: IZIHIRWE COMPANY LTD - System Dashboard
publish_to: 'none'
version: 1.0.0+1
environment:
  sdk: '>=3.0.0 <4.0.0'
dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
flutter:
  uses-material-design: true
[12:56, 9/29/2026] Allison: import 'package:flutter/material.dart';
void main()=>runApp(const IzihirweApp());
const burgundy=Color(0xFF6B001A),burgundyDark=Color(0xFF4A0012),gold=Color(0xFFD4AF37);
class IzihirweApp extends StatelessWidget{const IzihirweApp({super.key});@override Widget build(BuildContext c){return MaterialApp(debugShowCheckedModeBanner:false,title:'IZIHIRWE COMPANY LTD',theme:ThemeData(useMaterial3:true,colorScheme:ColorScheme.fromSeed(seedColor:burgundy)),home:const LoginScreen());}}
class LoginScreen extends StatefulWidget{const LoginScreen({super.key});@override State<LoginScreen> createState()=>_LoginScreenState();}
class LoginScreenState extends State<LoginScreen>{String role='admin';@override Widget build(BuildContext c){return Scaffold(backgroundColor:burgundy,body:Center(child:Container(padding:const EdgeInsets.all(24),constraints:const BoxConstraints(maxWidth:420),decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(20)),child:Column(mainAxisSize:MainAxisSize.min,children:[const Icon(Icons.local_laundry_service,size:60,color:burgundy),const Text('IZIHIRWE COMPANY LTD',style:TextStyle(fontWeight:FontWeight.bold,color:burgundy)),const Text('United in Work • Growing Together',style:TextStyle(fontSize:10,color:gold)),const SizedBox(height:16),SizedBox(width:double.infinity,child:ElevatedButton(style:ElevatedButton.styleFrom(backgroundColor:burgundy,foregroundColor:Colors.white),onPressed:()=>Navigator.pushReplacement(c,MaterialPageRoute(builder:()=>MainDashboard(role:role))),child:const Text('SIGN IN')))]))));}}
class MainDashboard extends StatefulWidget{final String role;const MainDashboard({super.key,required this.role});@override State<MainDashboard> createState()=>_MainDashboardState();}
class _MainDashboardState extends State<MainDashboard>{int idx=0;@override Widget build(BuildContext c){final pages=[const HomePage(),const Center(child:Text('Team 30')),const Center(child:Text('Attendance')),const Center(child:Text('Production 4,750/5,500')),const Center(child:Text('Payroll 79,612')),const Center(child:Text('Settings'))];return Scaffold(appBar:AppBar(backgroundColor:burgundy,foregroundColor:Colors.white,title:const Text('IZIHIRWE COMPANY LTD')),body:pages[idx],bottomNavigationBar:BottomNavigationBar(currentIndex:idx,selectedItemColor:burgundy,onTap:(v)=>setState(()=>idx=v),items:const[BottomNavigationBarItem(icon:Icon(Icons.home),label:'Home'),BottomNavigationBarItem(icon:Icon(Icons.people),label:'Team'),BottomNavigationBarItem(icon:Icon(Icons.calendar_month),label:'Attend'),BottomNavigationBarItem(icon:Icon(Icons.factory),label:'Prod'),BottomNavigationBarItem(icon:Icon(Icons.payments),label:'Payroll'),BottomNavigationBarItem(icon:Icon(Icons.settings),label:'Settings')]));}}
class HomePage extends StatelessWidget{const HomePage({super.key});@override Widget build(BuildContext c){return ListView(padding:const EdgeInsets.all(12),children:[Container(padding:const EdgeInsets.all(12),decoration:BoxDecoration(color:Colors.red.shade600,borderRadius:BorderRadius.circular(12),border:const Border(left:BorderSide(color:gold,width:6))),child:const Row(children:[Icon(Icons.warning,color:Colors.white),SizedBox(width:8),Expanded(child:Text('⚠️ GAMBURU! Imyenda yo gutwarwa <5h!',style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)))]))]);}}
