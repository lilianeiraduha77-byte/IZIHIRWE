html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IZIHIRWE COMPANY LTD - System Dashboard</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Font Awesome Icons -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- Google Fonts: Inter / Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Poppins', 'sans-serif'],
                    },
                    colors: {
                        burgundy: '#6B001A',
                        burgundyDark: '#4A0012',
                        burgundyLight: '#8B0021',
                        goldAccent: '#D4AF37',
                        softGray: '#F8F9FA'
                    }
                }
            }
        }
    </script>
    <style>
        body { font-family: 'Poppins', sans-serif; }
        .active-nav {
            color: #6B001A !important;
            font-weight: 700;
        }
        .active-nav-bg {
            background-color: #6B001A;
            color: #FFFFFF !important;
        }
        .custom-scrollbar::-webkit-scrollbar {
            width: 5px;
            height: 5px;
        }
        .custom-scrollbar::-webkit-scrollbar-thumb {
            background: #6B001A;
            border-radius: 10px;
        }
        .animate-fade-in {
            animation: fadeIn 0.3s ease-in-out;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(4px); }
            to { opacity: 1; transform: translateY(0); }
        }
        .urgent-pulse {
            animation: urgentPulse 1.5s infinite alternate;
        }
        @keyframes urgentPulse {
            0% { background-color: #FEF2F2; border-color: #EF4444; }
            100% { background-color: #FEE2E2; border-color: #DC2626; }
        }
    </style>
</head>
<body class="bg-gray-100 text-gray-800 min-h-screen flex flex-col justify-between">

    <!-- Toast Notification Banner -->
    <div id="toast-notification" class="fixed top-4 right-4 z-50 hidden max-w-sm bg-gray-900 text-white px-4 py-3 rounded-xl shadow-2xl border border-goldAccent flex items-center space-x-3 transition-all duration-300">
        <i id="toast-icon" class="fas fa-check-circle text-goldAccent text-xl"></i>
        <div class="text-xs">
            <h5 id="toast-title" class="font-bold text-white">Notification</h5>
            <p id="toast-message" class="text-gray-300 text-[11px]">Action completed successfully.</p>
        </div>
    </div>

    <!-- TOP HEADER / BRAND BAR -->
    <header class="bg-burgundy text-white shadow-md sticky top-0 z-40">
        <div class="max-w-7xl mx-auto px-4 py-2.5 flex justify-between items-center">
            <!-- Brand Logo & Slogan -->
            <div class="flex items-center space-x-3 cursor-pointer" onclick="switchDashboard('home')">
                <div class="relative w-11 h-11 rounded-full border-2 border-goldAccent bg-white flex items-center justify-center shadow-lg overflow-hidden p-0.5">
                    <img id="header-logo-img" src="logo.png" alt="IZIHIRWE Logo" class="w-full h-full object-contain rounded-full" onerror="this.style.display='none'; document.getElementById('header-logo-fallback').classList.remove('hidden');">
                    <div id="header-logo-fallback" class="hidden w-full h-full bg-burgundyDark flex items-center justify-center text-goldAccent font-bold text-xs">IZ</div>
                </div>
                <div>
                    <h1 class="font-bold text-lg leading-tight tracking-wide text-white">IZIHIRWE COMPANY LTD</h1>
                    <p class="text-[10px] text-goldAccent tracking-wider uppercase font-medium">United in Work • Growing Together</p>
                </div>
            </div>

            <!-- Top Right Profile & Role Badge -->
            <div class="flex items-center space-x-3">
                <!-- Delivery Urgent Bell Alerts Indicator -->
                <button id="btn-delivery-alerts" onclick="switchDashboard('production')" class="relative p-2 rounded-full hover:bg-burgundyDark transition text-white" title="Delivery Alerts">
                    <i class="fas fa-bell text-lg"></i>
                    <span id="alert-badge-count" class="absolute -top-1 -right-1 bg-red-500 text-white text-[9px] font-bold px-1.5 py-0.2 rounded-full hidden">0</span>
                </button>

                <div class="hidden sm:flex items-center space-x-2 bg-burgundyDark px-3 py-1.5 rounded-full border border-burgundyLight text-xs">
                    <span class="w-2.5 h-2.5 rounded-full bg-green-400 animate-pulse"></span>
                    <span id="top-user-name" class="font-semibold text-gray-200">Didier Habimana (Manager)</span>
                    <span id="role-badge" class="bg-goldAccent text-black text-[10px] font-bold px-2 py-0.5 rounded-full uppercase ml-1">ADMIN</span>
                </div>

                <button onclick="logoutSystem()" class="bg-white text-burgundy font-bold text-xs px-3 py-1.5 rounded-lg hover:bg-gray-100 transition shadow">
                    <i class="fas fa-sign-out-alt mr-1"></i> Logout
                </button>
            </div>
        </div>
    </header>

    <!-- URGENT DISPATCH NOTIFICATION BANNER (ADMIN ONLY) -->
    <div id="admin-delivery-warning-banner" class="hidden bg-red-600 text-white px-4 py-2.5 shadow-md border-b border-red-700 animate-pulse">
        <div class="max-w-7xl mx-auto flex items-center justify-between text-xs sm:text-sm font-semibold">
            <div class="flex items-center space-x-2">
                <i class="fas fa-exclamation-triangle text-goldAccent text-lg"></i>
                <span id="banner-warning-text">⚠️ GAMBURU! Hano hari imyenda igomba gutwarwa mu masaha ari munsi ya 5! (Urgent Order Dispatch Notice)</span>
            </div>
            <button onclick="switchDashboard('production')" class="bg-white text-red-700 px-3 py-1 rounded-lg text-xs font-bold hover:bg-gray-100 transition">
                <i class="fas fa-boxes mr-1"></i> Reba Imyenda (View Orders)
            </button>
        </div>
    </div>

    <!-- MAIN BODY WRAPPER -->
    <main class="flex-grow max-w-7xl w-full mx-auto p-3 sm:p-6 mb-20 md:mb-6">

        <!-- ========================================== -->
        <!-- 1. LOGIN SCREEN OVERLAY -->
        <!-- ========================================== -->
        <section id="sec-login" class="fixed inset-0 z-50 bg-burgundy flex items-center justify-center p-4">
            <div class="bg-white rounded-2xl shadow-2xl max-w-md w-full overflow-hidden text-center p-8 border border-burgundyLight relative">
                <!-- Custom Brand Logo -->
                <div class="w-24 h-24 bg-white rounded-full flex items-center justify-center mx-auto mb-4 border-4 border-goldAccent shadow-xl overflow-hidden p-1">
                    <img id="login-logo-img" src="logo.png" alt="IZIHIRWE Logo" class="w-full h-full object-contain rounded-full" onerror="this.style.display='none'; document.getElementById('login-logo-fallback').classList.remove('hidden');">
                    <div id="login-logo-fallback" class="hidden text-burgundy font-bold text-2xl"><i class="fas fa-building text-goldAccent text-3xl"></i></div>
                </div>
                <h2 class="text-2xl font-bold text-burgundy">IZIHIRWE COMPANY LTD</h2>
                <p class="text-xs text-gray-500 mb-6">System Access & Operations Portal</p>
                
                <!-- Login Role Selection Toggle -->
                <div class="flex bg-gray-100 p-1 rounded-xl mb-5">
                    <button id="btn-login-admin" onclick="setLoginRole('admin')" class="flex-1 py-2 text-xs font-bold rounded-lg bg-burgundy text-white transition">Admin / Manager</button>
                    <button id="btn-login-employee" onclick="setLoginRole('employee')" class="flex-1 py-2 text-xs font-bold rounded-lg text-gray-600 transition">Employee</button>
                </div>

                <form onsubmit="handleLogin(event)" class="space-y-4 text-left">
                    <div>
                        <label class="text-xs font-bold text-gray-600 uppercase">Phone Number</label>
                        <div class="relative mt-1">
                            <i class="fas fa-phone absolute left-3 top-3 text-gray-400 text-sm"></i>
                            <input type="text" id="login-phone" value="+250 785 123 456" required class="w-full pl-9 pr-3 py-2 border rounded-xl text-sm focus:ring-2 focus:ring-burgundy outline-none">
                        </div>
                    </div>
                    <div>
                        <label class="text-xs font-bold text-gray-600 uppercase">Security PIN</label>
                        <div class="relative mt-1">
                            <i class="fas fa-lock absolute left-3 top-3 text-gray-400 text-sm"></i>
                            <input type="password" id="login-pin" value="1234" required class="w-full pl-9 pr-3 py-2 border rounded-xl text-sm focus:ring-2 focus:ring-burgundy outline-none">
                        </div>
                    </div>
                    <button type="submit" class="w-full bg-burgundy hover:bg-burgundyDark text-white font-bold py-3 rounded-xl shadow-lg transition flex items-center justify-center space-x-2">
                        <span>SIGN IN TO DASHBOARD</span>
                        <i class="fas fa-arrow-right"></i>
                    </button>
                </form>
                <p class="text-xs text-gray-400 mt-6">&copy; 2026 IZIHIRWE Company Ltd. All rights reserved.</p>
            </div>
        </section>

        <!-- RESTRICTED ACCESS NOTICE FOR EMPLOYEES -->
        <div id="restricted-notice" class="hidden bg-red-50 border-l-4 border-red-600 p-4 mb-4 rounded-xl shadow-sm">
            <div class="flex items-center justify-between">
                <div class="flex items-center space-x-3">
                    <i class="fas fa-lock text-red-600 text-xl"></i>
                    <div>
                        <h4 class="font-bold text-red-800 text-sm">Access Restricted</h4>
                        <p class="text-xs text-red-700">As an Employee, access to Executive Dashboards (Overview & Team Management) is restricted. You may access Attendance, Production, Advances, and Security Settings.</p>
                    </div>
                </div>
                <button onclick="switchDashboard('attendance')" class="bg-red-600 text-white font-bold text-xs px-3 py-1.5 rounded-lg hover:bg-red-700">
                    Go to My Workspace
                </button>
            </div>
        </div>

        <!-- ========================================== -->
        <!-- 2. DASHBOARD 1: HOME OVERVIEW (ADMIN ONLY) -->
        <!-- ========================================== -->
        <section id="sec-home" class="space-y-6 animate-fade-in admin-only">
            <!-- Welcome Header Card -->
            <div class="bg-gradient-to-r from-burgundy to-burgundyDark text-white rounded-2xl p-6 shadow-lg flex flex-col md:flex-row justify-between items-start md:items-center">
                <div class="flex items-center space-x-4 mb-4 md:mb-0">
                    <div class="w-16 h-16 rounded-full border-2 border-goldAccent bg-white flex items-center justify-center font-bold text-2xl text-burgundy shadow overflow-hidden p-1">
                        <img src="logo.png" alt="IZIHIRWE" class="w-full h-full object-contain rounded-full" onerror="this.parentElement.innerHTML='DH'">
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold" id="user-display-name">Didier Habimana</h2>
                        <p class="text-xs text-red-200"><i class="fas fa-briefcase mr-1"></i> Operations Manager • <span class="text-green-300 font-semibold">● Online</span></p>
                    </div>
                </div>

                <div class="flex flex-col sm:flex-row items-end md:items-center space-y-3 sm:space-y-0 sm:space-x-3 w-full md:w-auto">
                    <!-- Language Selection Toggle Button -->
                    <div class="flex items-center bg-black/25 p-1 rounded-xl text-xs border border-white/20">
                        <button id="lang-en" onclick="setLanguage('en')" class="px-3 py-1.5 rounded-lg font-bold transition bg-white text-burgundy shadow">English</button>
                        <button id="lang-rw" onclick="setLanguage('rw')" class="px-3 py-1.5 rounded-lg font-bold transition text-white hover:bg-white/10">Kinyarwanda</button>
                    </div>

                    <div class="flex space-x-2 w-full sm:w-auto">
                        <button onclick="switchDashboard('attendance')" class="flex-1 sm:flex-none bg-white text-burgundy font-bold text-xs px-4 py-2.5 rounded-xl shadow hover:bg-gray-100 transition flex items-center justify-center">
                            <i class="fas fa-clock mr-1"></i> <span id="txt-btn-attendance">Attendance Log</span>
                        </button>
                        <button onclick="switchDashboard('payroll')" class="flex-1 sm:flex-none bg-green-600 text-white font-bold text-xs px-4 py-2.5 rounded-xl shadow hover:bg-green-700 transition flex items-center justify-center">
                            <i class="fas fa-money-bill-wave mr-1"></i> <span id="txt-btn-payroll">Payroll & Advances</span>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Urgent Delivery Notification Card on Overview -->
            <div id="overview-urgent-alert" class="hidden bg-gradient-to-r from-red-600 to-red-800 text-white p-4 rounded-2xl shadow border-l-8 border-goldAccent items-center justify-between">
                <div class="flex items-center space-x-3">
                    <div class="p-3 bg-white/20 rounded-xl text-xl animate-bounce"><i class="fas fa-clock"></i></div>
                    <div>
                        <h4 id="lbl-urgent-title" class="font-bold text-sm">MBABAZI / ALERT: Imyenda iri peding yo gutwarwa!</h4>
                        <p id="lbl-urgent-desc" class="text-xs text-red-100">Hari amasahasi munsi ya 5 kugirango abakiriya baze gutwara imyenda yabo.</p>
                    </div>
                </div>
                <button onclick="switchDashboard('production')" class="bg-goldAccent text-black font-bold text-xs px-4 py-2 rounded-xl shadow hover:bg-amber-400">
                    Kureba Imyenda
                </button>
            </div>

            <!-- Overview Metrics Grid -->
            <div class="grid grid-cols-2 md:grid-cols-4 gap-4">
                <div onclick="switchDashboard('team')" class="bg-white p-4 rounded-xl shadow-sm border border-gray-100 hover:shadow-md transition cursor-pointer">
                    <div class="flex justify-between items-center mb-2">
                        <span id="lbl-metric-team" class="text-xs font-semibold text-gray-500 uppercase">Total Workforce</span>
                        <span class="p-2 bg-red-50 text-burgundy rounded-lg"><i class="fas fa-users text-sm"></i></span>
                    </div>
                    <p class="text-2xl font-bold text-gray-800" id="metric-total-team">30</p>
                    <p id="lbl-metric-team-sub" class="text-[11px] text-green-600 mt-1"><i class="fas fa-user-check"></i> 28 Active Payroll</p>
                </div>

                <div onclick="switchDashboard('attendance')" class="bg-white p-4 rounded-xl shadow-sm border border-gray-100 hover:shadow-md transition cursor-pointer">
                    <div class="flex justify-between items-center mb-2">
                        <span id="lbl-metric-present" class="text-xs font-semibold text-gray-500 uppercase">Present Today</span>
                        <span class="p-2 bg-green-50 text-green-600 rounded-lg"><i class="fas fa-check-circle text-sm"></i></span>
                    </div>
                    <p class="text-2xl font-bold text-gray-800">28</p>
                    <p id="lbl-metric-present-sub" class="text-[11px] text-amber-600 mt-1"><i class="fas fa-exclamation-triangle"></i> 2 Late (Pending Approval)</p>
                </div>

                <div onclick="switchDashboard('production')" class="bg-white p-4 rounded-xl shadow-sm border border-gray-100 hover:shadow-md transition cursor-pointer">
                    <div class="flex justify-between items-center mb-2">
                        <span id="lbl-metric-production" class="text-xs font-semibold text-gray-500 uppercase">Daily Output (Sacks)</span>
                        <span class="p-2 bg-blue-50 text-blue-600 rounded-lg"><i class="fas fa-boxes text-sm"></i></span>
                    </div>
                    <p class="text-2xl font-bold text-gray-800">4,750 / 5,500</p>
                    <p id="lbl-metric-production-sub" class="text-[11px] text-blue-600 mt-1"><i class="fas fa-chart-line"></i> 86% Target Achieved</p>
                </div>

                <div onclick="switchDashboard('payroll')" class="bg-white p-4 rounded-xl shadow-sm border border-gray-100 hover:shadow-md transition cursor-pointer">
                    <div class="flex justify-between items-center mb-2">
                        <span id="lbl-metric-advances" class="text-xs font-semibold text-gray-500 uppercase">Advances Requested</span>
                        <span class="p-2 bg-amber-50 text-amber-600 rounded-lg"><i class="fas fa-hand-holding-usd text-sm"></i></span>
                    </div>
                    <p class="text-xl font-bold text-amber-700">3 Pending</p>
                    <p id="lbl-metric-advances-sub" class="text-[11px] text-gray-500 mt-1"><i class="fas fa-clock"></i> Awaiting Approval</p>
                </div>
            </div>

            <!-- Quick Navigation Modules -->
            <h3 id="lbl-modules-title" class="font-bold text-gray-700 text-base">Core Operating Modules</h3>
            <div class="grid grid-cols-2 sm:grid-cols-3 lg:grid-cols-6 gap-3">
                <button onclick="switchDashboard('team')" class="p-4 bg-white rounded-xl shadow-sm border text-center hover:border-burgundy transition group">
                    <div class="w-12 h-12 bg-red-50 text-burgundy rounded-xl flex items-center justify-center mx-auto mb-2 group-hover:bg-burgundy group-hover:text-white transition">
                        <i class="fas fa-users text-lg"></i>
                    </div>
                    <p id="lbl-mod-team" class="text-xs font-bold text-gray-800">Team Management</p>
                    <p class="text-[10px] text-gray-400">Admin Only</p>
                </button>

                <button onclick="switchDashboard('attendance')" class="p-4 bg-white rounded-xl shadow-sm border text-center hover:border-burgundy transition group">
                    <div class="w-12 h-12 bg-green-50 text-green-600 rounded-xl flex items-center justify-center mx-auto mb-2 group-hover:bg-green-600 group-hover:text-white transition">
                        <i class="fas fa-calendar-check text-lg"></i>
                    </div>
                    <p id="lbl-mod-attendance" class="text-xs font-bold text-gray-800">Attendance</p>
                    <p class="text-[10px] text-gray-400">Clock In & Shift</p>
                </button>

                <button onclick="switchDashboard('production')" class="p-4 bg-white rounded-xl shadow-sm border text-center hover:border-burgundy transition group relative">
                    <div class="w-12 h-12 bg-blue-50 text-blue-600 rounded-xl flex items-center justify-center mx-auto mb-2 group-hover:bg-b
