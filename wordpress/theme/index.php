<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en-US">
<head profile="http://gmpg.org/xfn/11">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>The Awesome Foundation</title>
<link rel="shortcut icon" href="/images/favicon.ico">
<link rel="stylesheet" href="/stylesheets/screen.css" type="text/css" media="screen" />
<!-- <link rel="alternate" type="application/rss+xml" title="The Awesome Foundation Feed" href="/feed/" />  -->
</head>
<body>

<div id="navbar">
  <div class="wrapper">
    <ul id="nav">
      <li><a href="/" title="Home">Home</a></li>
      <li><a href="/apply/" title="Apply">Apply</a></li>
      <li><a href="/about/" title="About">About</a></li>
      <li><a href="/faq/" title="FAQ">FAQ</a></li>
      <li><a href="/contact/" title="Contact">Contact</a></li>
      <li><a href="/chapters/" title="Chapters">Chapters</a></li>
      <li><a href="/fellows/" title="Fellows">Fellows</a></li>
      <li><a href="/calendar/" title="Calendar">Calendar</a></li>
      <li><a href="/blog/" title="Blog">Blog</a></li>
    </ul>
    <ul id="follow">
      <li><a href="http://twitter.com/awesomefound"><img src="/images/icons/twitter.png" title="Twitter" /></a></li>
      <li><a href="http://www.facebook.com/awesomefoundation"><img src="/images/icons/facebook.png" title="Facebook" /></a></li>
      <li><a href="/blog/feed/"><img src="/images/icons/feed.png" title="Feed" /></a></li>
      <li><a href="mailto:contact@awesomefoundation.org"><img src="/images/icons/email.png" /></a></li>
    </ul>
  </div>
</div>

<div id="header">
  <div class="wrapper">
    <h1><a href="/" title="Home"><img src="/images/logo.png" alt="The Awesome Foundation" /></a></h1>
  </div>
</div>

<div id="content">
  <div class="wrapper">

    <div id="main">

    <?php include( TEMPLATEPATH . '/entries.php' ); ?>
    <?php include( TEMPLATEPATH . '/entries-navigation.php' ); ?>

    </div>

    <div id="sidebar">
    <ul>
    <?php if ( !function_exists('dynamic_sidebar')
            || !dynamic_sidebar() ) : ?>
    <?php endif; ?>
    </ul>
    <ul>
    	<li><h2>Archives</h2>
    		<ul>
    		<?php wp_get_archives('type=monthly'); ?>
    		</ul>
    	</li>
    	<?php wp_list_categories('show_count=1&title_li=<h2>Categories</h2>'); ?>
    </ul>
    </div>

  </div>
</div>

<div style="clear: both"></div>

<div id="footer">
  <div class="wrapper">
    <div>Designed and developed by <a href="http://jonpierce.com">Jon Pierce</a>, Boston trustee</div>
  </div>
</div>

<script type="text/javascript" src="/javascripts/jquery.min.js"></script>
</body>
</html>
