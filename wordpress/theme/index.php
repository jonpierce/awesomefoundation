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

    <?php if ( is_home() || is_single() ) : ?>

      <?php include( TEMPLATEPATH . '/entries.php' ); ?>
      <?php include( TEMPLATEPATH . '/entries-navigation.php' ); ?>

    <?php elseif ( is_archive() ) : ?>
      
      <?php if (have_posts()) : ?>

        <?php $post = $posts[0]; // Hack. Set $post so that the_date() works. ?>
        <?php /* If this is a category archive */ if (is_category()) { ?>
        	<h2 class="pagetitle">Archive for category &#8216;<?php single_cat_title(); ?>&#8217;</h2>
        <?php /* If this is a tag archive */ } elseif( is_tag() ) { ?>
        	<h2 class="pagetitle">Archive for tag &#8216;<?php single_tag_title(); ?>&#8217;</h2>
        <?php /* If this is a daily archive */ } elseif (is_day()) { ?>
        	<h2 class="pagetitle">Archive for <?php the_time('F jS, Y'); ?></h2>
        <?php /* If this is a monthly archive */ } elseif (is_month()) { ?>
        	<h2 class="pagetitle">Archive for <?php the_time('F, Y'); ?></h2>
        <?php /* If this is a yearly archive */ } elseif (is_year()) { ?>
        	<h2 class="pagetitle">Archive for <?php the_time('Y'); ?></h2>
        <?php /* If this is an author archive */ } elseif (is_author()) { ?>
        	<h2 class="pagetitle">Archive for author <?php get_query_var('author_name'); ?></h2>
        <?php /* If this is a paged archive */ } elseif (isset($_GET['paged']) && !empty($_GET['paged'])) { ?>
        	<h2 class="pagetitle">Archives</h2>
        <?php } ?>

        <?php include( TEMPLATEPATH . '/entries-navigation.php' ); ?>
        <?php include( TEMPLATEPATH . '/entries.php' ); ?>
        <?php include( TEMPLATEPATH . '/entries-navigation.php' ); ?>

      <?php else : ?>

      	<h2>Sorry, we didn't find any matching posts</h2>

      <?php endif; ?>
      
    <?php elseif ( is_404() ) : ?>

    	<h2 class="center">Zoiks!</h2>
    	<p>We couldn't find the awesomeness you requested.</p>

    <?php endif; ?>

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
