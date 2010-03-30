<?php while ( have_posts() ) : the_post() ?>
<div <?php post_class() ?> id="post-<?php the_ID(); ?>">
  <h2><a href="<?php the_permalink() ?>" rel="bookmark" title="Permalink to <?php the_title_attribute(); ?>"><?php the_title(); ?></a></h2>
	<small class="date"><?php the_time('l, F jS, Y') ?> <!-- by <?php the_author() ?> --></small>
  <div class="entry"><?php the_content() ?></div>
	<small class="author">Posted by <?php the_author() ?> at <?php the_time('g:i a'); ?></small>
</div>
<?php endwhile ?>
