<?php while ( have_posts() ) : the_post() ?>
<div <?php post_class() ?> id="post-<?php the_ID(); ?>">
  <h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
	<small class="date"><?php the_time('l, F jS, Y') ?> <!-- by <?php the_author() ?> --></small>
  <div class="entry"><?php the_content() ?></div>
	<small class="author">Posted by <?php the_author() ?> at <?php the_time('g:i a'); ?></small>
	<a class="comments_permalink" href="<?php the_permalink() ?>#disqus_thread">Comments</a>
	
	<?php if ( is_single() ) : ?>
  <div id="disqus_thread"></div>
  <script type="text/javascript">
    /**
      * var disqus_identifier; [Optional but recommended: Define a unique identifier (e.g. post id or slug) for this thread] 
      */
    (function() {
     var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
     dsq.src = 'http://awesomefoundationblog.disqus.com/embed.js';
     (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
  </script>
  <noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript=awesomefoundationblog">comments powered by Disqus.</a></noscript>
  <a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>
  <?php endif; ?>

</div>
<?php endwhile ?>
