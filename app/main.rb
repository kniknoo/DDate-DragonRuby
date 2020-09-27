require 'lib/ddate.rb'

$date = DDate.new
$weekday = $date.day_of_week
$monthday = "#{$date.day_of_month}#{$date.ordinal}"
$month = $date.month
$year = $date.year
$white = [255,255,255,255]
$today = [0, 400, "Today is", 12, 0, $white]
$the = [150, 300, "the", 12, 0, $white]
$day_of = [200, 200, "day of", 12, 0, $white]
$yold = [300, 100, "in the YOLD", 12, 0, $white]
$shake_x = 500
$shake_y = 600
$source_w_rand = 1280
$source_h_rand = 720
$alpha = 200
$angle = 0
$dseg = 'fonts/DSEG14Modern-Regular.ttf'
def tick args
  if args.state.tick_count == 0
    args.render_target(:date).labels << [$today, $the, $day_of, $yold ]
    args.render_target(:weekday).labels << [0, 50, $weekday, 12, 0, rand(255), rand(255), rand(255)]
    args.render_target(:monthday).labels << [0, 50, $monthday, 12, 0, rand(255), rand(255), rand(255)]
    args.render_target(:month).labels << [0, 50, $month, 12, 0, rand(255), rand(255), rand(255)]
    args.render_target(:year).labels << [0, 50, $year, 12, 0, rand(255), rand(255), rand(255)]
  end
  shake_x
  shake_y
  random_stretch
  random_alpha
  random_angle
  $time = Time.now if args.state.tick_count % 60 == 0
  args.solids << [0,0,1280,720,16,16,16]
  args.solids << [80, 20, 290, 125, 31, 33, 32]
  args.solids << [100, 40, 250, 75, 26, 8, 6]
  args.sprites << {x: 20, y: 50, w: 1280, h: 720, path: :date, source_w: 550, source_h: 460, r: rand(255), g: rand(255), b: rand(255)}
  args.sprites << {x: $shake_x, y: $shake_y, w: 1280, h: 720, path: :weekday, source_w: 1280, source_h: 720}
  args.sprites << {x: 600, y: 450, w: 1280, h: 720, path: :monthday, source_w: $source_w_rand, source_h: $source_h_rand}
  args.sprites << {x: 800, y: 300, w: 1280, h: 720, path: :month, source_w: 1280, source_h: 720, a: $alpha}
  args.sprites << {x: 900, y: 50, w: 90, h: 50, path: :year, source_w: 90, source_h: 50, angle: $angle}
  args.labels << {x: 100, y: 100, text: "~~:~~", size_enum: 12, r: 83, g: 16, b: 10, a: 127, font: $dseg}
  args.labels << {x: 100, y: 100, text: "%02d:%02d" % [$time.hour, $time.min], size_enum: 12, r: 252, g: 8, b: 42, font: $dseg}
  args.labels << {x: 260, y: 88, text: "~~", size_enum: 6, r: 83, g: 16, b: 10, a: 127, font: $dseg}
  args.labels << {x: 260, y: 88, text: "%02d" % [$time.sec], size_enum: 6, r: 252, g: 8, b: 42, font: $dseg}
end

def shake_x
  $shake_x += rand * 4 - 2
  $shake_x = 950 if $shake_x > 950
  $shake_x = 450 if $shake_x < 450
end
def shake_y
  $shake_y += rand * 2 - 1
  $shake_y = 650 if $shake_y > 650
  $shake_y = 550 if $shake_y < 550
end
def random_stretch
  $source_w_rand += rand * 10 - 5
  $source_h_rand += rand * 10 - 5
  $source_w_rand = 1280 if $source_w_rand > 1280
  $source_w_rand = 320 if $source_w_rand < 320
  $source_h_rand = 720 if $source_h_rand > 720
  $source_h_rand = 360 if $source_h_rand < 360

end
def random_alpha
  $alpha += rand * 20 - 10
  $alpha = 255 if $alpha > 255
  $alpha = 50 if $alpha < 50
end
def random_angle
  $angle += rand * 2 - 1
end
