<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

        <meta charset="utf-8">

        <title>AppUI - Web App Bootstrap Admin Template</title>

        <meta name="description" content="AppUI is a Web App Bootstrap Admin Template created by pixelcave and published on Themeforest">
        <meta name="author" content="pixelcave">
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width,initial-scale=1.0,user-scalable=0">


        <link rel="shortcut icon" href="/resources/img/favicon.png">
        <link rel="apple-touch-icon" href="/resources/img/icon57.png" sizes="57x57">
        <link rel="apple-touch-icon" href="/resources/img/icon72.png" sizes="72x72">
        <link rel="apple-touch-icon" href="/resources/img/icon76.png" sizes="76x76">
        <link rel="apple-touch-icon" href="/resources/img/icon114.png" sizes="114x114">
        <link rel="apple-touch-icon" href="/resources/img/icon120.png" sizes="120x120">
        <link rel="apple-touch-icon" href="/resources/img/icon144.png" sizes="144x144">
        <link rel="apple-touch-icon" href="/resources/img/icon152.png" sizes="152x152">
        <link rel="apple-touch-icon" href="/resources/img/icon180.png" sizes="180x180">

        <!-- END Icons -->

        <!-- Stylesheets -->
        <!-- Bootstrap is included in its original form, unaltered -->
        <link rel="stylesheet" href="/resources/css/bootstrap.min.css">

        <!-- Related styles of various icon packs and plugins -->
        <link rel="stylesheet" href="/resources/css/plugins.css">

        <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
        <link rel="stylesheet" href="/resources/css/main.css">

        <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->

        <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
        <link rel="stylesheet" href="/resources/css/themes.css">
        <!-- END Stylesheets -->

        <!-- Modernizr (browser feature detection library) -->
        <script src="/resources/js/vendor/modernizr-3.3.1.min.js"></script>
</head>


<body>
<!-- Page Wrapper -->
        <!-- In the PHP version you can set the following options from inc/config file -->
        <!--
            Available classes:

            'page-loading'      enables page preloader
        -->
        <div id="page-wrapper" class="page-loading">
            <!-- Preloader -->
            <!-- Preloader functionality (initialized in js/app.js) - pageLoading() -->
            <!-- Used only if page preloader enabled from inc/config (PHP version) or the class 'page-loading' is added in #page-wrapper element (HTML version) -->
            <div class="preloader">
                <div class="inner">
                    <!-- Animation spinner for all modern browsers -->
                    <div class="preloader-spinner themed-background hidden-lt-ie10"></div>

                    <!-- Text for IE9 -->
                    <h3 class="text-primary visible-lt-ie10"><strong>Loading..</strong></h3>
                </div>
            </div>
            <!-- END Preloader -->

            <!-- Page Container -->
            <!-- In the PHP version you can set the following options from inc/config file -->
            <!--
                Available #page-container classes:

                'sidebar-light'                                 for a light main sidebar (You can add it along with any other class)

                'sidebar-visible-lg-mini'                       main sidebar condensed - Mini Navigation (> 991px)
                'sidebar-visible-lg-full'                       main sidebar full - Full Navigation (> 991px)

                'sidebar-alt-visible-lg'                        alternative sidebar visible by default (> 991px) (You can add it along with any other class)

                'header-fixed-top'                              has to be added only if the class 'navbar-fixed-top' was added on header.navbar
                'header-fixed-bottom'                           has to be added only if the class 'navbar-fixed-bottom' was added on header.navbar

                'fixed-width'                                   for a fixed width layout (can only be used with a static header/main sidebar layout)

                'enable-cookies'                                enables cookies for remembering active color theme when changed from the sidebar links (You can add it along with any other class)
            -->
            <div id="page-container" class="header-fixed-top sidebar-visible-lg-full">
                <!-- Alternative Sidebar -->
                <div id="sidebar-alt" tabindex="-1" aria-hidden="true">
                    <!-- Toggle Alternative Sidebar Button (visible only in static layout) -->
                    <a href="javascript:void(0)" id="sidebar-alt-close" onclick="App.sidebar('toggle-sidebar-alt');"><i class="fa fa-times"></i></a>

                    <!-- Wrapper for scrolling functionality -->
                    <div id="sidebar-scroll-alt">
                        <!-- Sidebar Content -->
                        <div class="sidebar-content">
                            <!-- Profile -->
                            <div class="sidebar-section">
                                <h2 class="text-light"><a href="/profile/profile">Profile</a></h2>
                                <!-- <form action="index.html" method="post" class="form-control-borderless" onsubmit="return false;">
                                    <div class="form-group">
                                        <label for="side-profile-name">Name</label>
                                        <input type="text" id="side-profile-name" name="side-profile-name" class="form-control" value="John Doe">
                                    </div>
                                    <div class="form-group">
                                        <label for="side-profile-email">Email</label>
                                        <input type="email" id="side-profile-email" name="side-profile-email" class="form-control" value="john.doe@example.com">
                                    </div>
                                    <div class="form-group">
                                        <label for="side-profile-password">New Password</label>
                                        <input type="password" id="side-profile-password" name="side-profile-password" class="form-control">
                                    </div>
                                    <div class="form-group">
                                        <label for="side-profile-password-confirm">Confirm New Password</label>
                                        <input type="password" id="side-profile-password-confirm" name="side-profile-password-confirm" class="form-control">
                                    </div>
                                    <div class="form-group remove-margin">
                                        <button type="submit" class="btn btn-effect-ripple btn-primary" onclick="App.sidebar('close-sidebar-alt');">Save</button>
                                    </div>
                                </form> -->
                            </div>
                            <!-- END Profile -->

                            <!-- Settings -->
                            <div class="sidebar-section">
                                <h2 class="text-light">Settings</h2>
                                <form action="index.html" method="post" class="form-horizontal form-control-borderless" onsubmit="return false;">
                                    <div class="form-group">
                                        <label class="col-xs-7 control-label-fixed">Notifications</label>
                                        <div class="col-xs-5">
                                            <label class="switch switch-success"><input type="checkbox" checked><span></span></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-xs-7 control-label-fixed">Public Profile</label>
                                        <div class="col-xs-5">
                                            <label class="switch switch-success"><input type="checkbox" checked><span></span></label>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-xs-7 control-label-fixed">Enable API</label>
                                        <div class="col-xs-5">
                                            <label class="switch switch-success"><input type="checkbox"><span></span></label>
                                        </div>
                                    </div>
                                    <div class="form-group remove-margin">
                                        <button type="submit" class="btn btn-effect-ripple btn-primary" onclick="App.sidebar('close-sidebar-alt');">Save</button>
                                    </div>
                                </form>
                            </div>
                            <!-- END Settings -->
                        </div>
                        <!-- END Sidebar Content -->
                    </div>
                    <!-- END Wrapper for scrolling functionality -->
                </div>
                <!-- END Alternative Sidebar -->

                <!-- Main Sidebar -->
                <div id="sidebar">
                    <!-- Sidebar Brand -->
                    <div id="sidebar-brand" class="themed-background">
                        <a href="/login/main.do" class="sidebar-title">
                            <i class="fa fa-cube"></i> <span class="sidebar-nav-mini-hide">App<strong>UI</strong></span>
                        </a>
                    </div>
                    <!-- END Sidebar Brand -->

                    <!-- Wrapper for scrolling functionality -->
                    <div id="sidebar-scroll">
                        <!-- Sidebar Content -->
                        <div class="sidebar-content">
                            <!-- Sidebar Navigation -->
                            <ul class="sidebar-nav">
                                <li>
                                    <a href="/login/main.do" class=" active"><i class="gi gi-compass sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">HOME</span></a>
                                </li>
                                <li class="sidebar-separator">
                                    <i class="fa fa-ellipsis-h"></i>
                                </li>
                                <li>
                                    <a href="#" class="sidebar-nav-menu"><i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="fa fa-rocket sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">게시판</span></a>
                                    <ul>
                                        <li>
                                            <a href="notice/notice_list.do">공지사항</a>
                                        </li>
                                        <li>
                                            <a href="/meetingboard/meetingBoardList">회의록</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="sidebar-nav-menu"><i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="gi gi-airplane sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">개인 업무 관리</span></a>
                                    <ul>
                                        <li>
                                        	<a href="#" class="sidebar-nav-submenu"><i class="fa fa-chevron-left sidebar-nav-indicator"></i>일정 관리</a>
                                            <ul>
                                                <li>
                                                    <a href="/todo/typelist">To-do Type</a>
                                                </li>
                                                <li>
                                                    <a href="/todo/typelist">Calendar</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                        	<a href="#" class="sidebar-nav-submenu"><i class="fa fa-chevron-left sidebar-nav-indicator"></i>소셜</a>
                                            <ul>
                                                <li>
                                                    <a href="/profile/profile">프로필 관리</a>
                                                </li>
                                                <li>
                                            		<a href="/contact/contactlist">주소록</a>
                                                </li>
                                                <li>
                                            		<a href="/mail/mailform.do">E-mail 보내기</a>
                                        		</li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="sidebar-nav-menu"><i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="gi gi-more_items sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">업무</span></a>
                                    <ul>
                                        <li>
                                        	<a href="#" class="sidebar-nav-submenu"><i class="fa fa-chevron-left sidebar-nav-indicator"></i>전자결재</a>
                                            <ul>
                                                <li>

                                                     <a href="/document/documentList">결재목록</a>

                                                </li>
                                            </ul>
                                        </li>
                                        <li>
                                        	<a href="#" class="sidebar-nav-submenu"><i class="fa fa-chevron-left sidebar-nav-indicator"></i>설문조사</a>
                                            <ul>
                                                <li>
                                            		<a href="/poll/pollinsertform">설문조사</a>
                                                </li>
                                                <li>
                                                    <a href="page_forms_validation.html">Validation</a>
                                                </li>
                                            </ul>
                                        </li>
                                        
                                    </ul>
                                </li>
                                <li>
                                    <a href="#" class="sidebar-nav-menu"><i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="fa fa-gift sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">협업</span></a>
                                    <ul>
                                        <li>
                                            <a href="#" class="sidebar-nav-submenu"><i class="fa fa-chevron-left sidebar-nav-indicator"></i>메신저</a>
                                            <ul>
                                                <li>
                                                    <a href="page_ready_blank.html">채팅</a>
                                                </li>
                                                <li>
                                                    <a href="/video/videochat">화상전화</a>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </li>
                                <c:if test="${sessionScope.employee.master=='y'}">
                                <li class="sidebar-separator">
                                    <i class="fa fa-ellipsis-h">Master Page</i>
                                </li>
                                <li>
                                <a href="#" class="sidebar-nav-menu"><i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="gi gi-more_items sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">관리자</span></a>
                                    <ul>
                                        <li>
                                            <a href="/master/insertmemform.do">회원 추가</a>
                                        </li>
                                        <li>
                                            <a href="/master/listmember">회원 관리</a>
                                        </li>
                                    </ul>
                                </li>
                                
                                </c:if>
                            </ul>
                            <!-- END Sidebar Navigation -->

                            <!-- Color Themes -->
                            <!-- Preview a theme on a page functionality can be found in js/app.js - colorThemePreview() -->
                            <div class="sidebar-section sidebar-nav-mini-hide">
                                <div class="sidebar-separator push">
                                    <i class="fa fa-ellipsis-h"></i>
                                </div>
                                <ul class="sidebar-themes clearfix">
                                    <li>
                                        <a href="javascript:void(0)" class="themed-background-default" data-toggle="tooltip" title="Default" data-theme="default" data-theme-navbar="navbar-inverse" data-theme-sidebar="">
                                            <span class="section-side themed-background-dark-default"></span>
                                            <span class="section-content"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" class="themed-background-default" data-toggle="tooltip" title="Default + Light Sidebar" data-theme="default" data-theme-navbar="navbar-inverse" data-theme-sidebar="sidebar-light">
                                            <span class="section-side"></span>
                                            <span class="section-content"></span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0)" class="themed-background-default" data-toggle="tooltip" title="Default + Light Header" data-theme="default" data-theme-navbar="navbar-default" data-theme-sidebar="">
                                            <span class="section-header"></span>
                                            <span class="section-side themed-background-dark-default"></span>
                                            <span class="section-content"></span>
                                        </a>
                                    </li>
                                    
                                </ul>
                            </div>
                            <!-- END Color Themes -->
                        </div>
                        <!-- END Sidebar Content -->
                    </div>
                    <!-- END Wrapper for scrolling functionality -->

                    <!-- Sidebar Extra Info -->
                    <div id="sidebar-extra-info" class="sidebar-content sidebar-nav-mini-hide">
                        <div class="text-center">
                            <small>Crafted with <i class="fa fa-heart text-danger"></i> by <a href="https://1.envato.market/ydb" target="_blank">pixelcave</a></small><br>
                            <small><span id="year-copy"></span> &copy; <a href="https://1.envato.market/DXa" target="_blank">AppUI 2.9</a></small>
                        </div>
                    </div>
                    <!-- END Sidebar Extra Info -->
                </div>
                <!-- END Main Sidebar -->

                <!-- Main Container -->
                <div id="main-container">
                    <!-- Header -->
                    <!-- In the PHP version you can set the following options from inc/config file -->
                    <!--
                        Available header.navbar classes:

                        'navbar-default'            for the default light header
                        'navbar-inverse'            for an alternative dark header

                        'navbar-fixed-top'          for a top fixed header (fixed main sidebar with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar())
                            'header-fixed-top'      has to be added on #page-container only if the class 'navbar-fixed-top' was added

                        'navbar-fixed-bottom'       for a bottom fixed header (fixed main sidebar with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar()))
                            'header-fixed-bottom'   has to be added on #page-container only if the class 'navbar-fixed-bottom' was added
                    -->
                    <header class="navbar navbar-inverse navbar-fixed-top">
                        <!-- Left Header Navigation -->
                        <ul class="nav navbar-nav-custom">
                            <!-- Main Sidebar Toggle Button -->
                            <li>
                                <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');this.blur();">
                                    <i class="fa fa-ellipsis-v fa-fw animation-fadeInRight" id="sidebar-toggle-mini"></i>
                                    <i class="fa fa-bars fa-fw animation-fadeInRight" id="sidebar-toggle-full"></i>
                                </a>
                            </li>
                            <!-- END Main Sidebar Toggle Button -->

                            <!-- Header Link -->
                            <li class="hidden-xs animation-fadeInQuick">
                                <a href=""><strong>WELCOME</strong></a>
                            </li>
                            <!-- END Header Link -->
                        </ul>
                        <!-- END Left Header Navigation -->

                        <!-- Right Header Navigation -->
                        <ul class="nav navbar-nav-custom pull-right">
                            <!-- Search Form -->
                            
                            <!-- END Search Form -->

                            <!-- Alternative Sidebar Toggle Button -->
                            
                            <!-- END Alternative Sidebar Toggle Button -->

                            <!-- User Dropdown -->
                            <li class="dropdown animation-slideDown">
                                <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
									<c:if test="${sessionScope.profilepic ==null}"><img src="/resources/img/placeholders/avatars/avatar13@2x.jpg" alt="avatar">
                                            </c:if>
                                            <c:if test="${sessionScope.profilepic !=null}"><img src='/profile/displayprofile?fileName=${profilepic}' alt="avatar">
                                            	</c:if>

                                </a>

                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li class="dropdown-header">
                                        <strong>${sessionScope.employee.name }</strong>님! 환영합니다.
                                    </li>
                                    
                                    <li>
                                        <a href="/profile/profile">
                                            <i class="fa fa-pencil-square fa-fw pull-right"></i>
                                            Profile
                                        </a>
                                    </li>
                                    
                                    <li>
                                        <a href="page_ready_lock_screen.html">
                                            <i class="gi gi-lock fa-fw pull-right"></i>
                                            Lock Account
                                        </a>
                                    </li>
                                    <li>
                                            <a href="javascript:logoutform.submit();">
                                            <form action="/login/logout" method="post" name="logoutform">
												<input type="hidden" name="{_csrf.parameterName}" value="{_crsf.token}"/>
												 <i class="fa fa-power-off fa-fw pull-right"></i>
												 Log out
											</form>
											</a>
                                    </li>
                                </ul>
                            </li>
                            <!-- END User Dropdown -->
                        </ul>
                        <!-- END Right Header Navigation -->
                    </header>
                    <!-- END Header -->
	
                   <!-- 챗봇 -->
                   <!-- Channel Plugin Scripts -->
<script>
  (function() {
    var w = window;
    if (w.ChannelIO) {
      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
    }
    var d = window.document;
    var ch = function() {
      ch.c(arguments);
    };
    ch.q = [];
    ch.c = function(args) {
      ch.q.push(args);
    };
    w.ChannelIO = ch;
    function l() {
      if (w.ChannelIOInitialized) {
        return;
      }
      w.ChannelIOInitialized = true;
      var s = document.createElement('script');
      s.type = 'text/javascript';
      s.async = true;
      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
      s.charset = 'UTF-8';
      var x = document.getElementsByTagName('script')[0];
      x.parentNode.insertBefore(s, x);
    }
    if (document.readyState === 'complete') {
      l();
    } else if (window.attachEvent) {
      window.attachEvent('onload', l);
    } else {
      window.addEventListener('DOMContentLoaded', l, false);
      window.addEventListener('load', l, false);
    }
  })();
  ChannelIO('boot', {
    "pluginKey": "c9108fd1-aaf0-4d38-99a2-6688d7d5ef39"
  });
</script>
<!-- End Channel Plugin -->

        <!-- jQuery, Bootstrap, jQuery plugins and Custom JS code -->
        <script src="/resources/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="/resources/js/vendor/bootstrap.min.js"></script>
        <script src="/resources/js/plugins.js"></script>
        <script src="/resources/js/app.js"></script>

        <!-- Load and execute javascript code used only in this page -->
<!--         <script src="/resources/js/pages/readyDashboard.js"></script>
        <script>$(function(){ ReadyDashboard.init(); });</script>
<<<<<<< HEAD

=======
 --><!-- 나만 있어서 일단 주석  -->

</body>
</html>

