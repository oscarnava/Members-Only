# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

posts = [
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nec justo semper, tincidunt risus non, posuere enim. Cras a aliquam nibh. Donec sit amet accumsan arcu. Aenean rhoncus est mi, a cursus enim rhoncus quis. Etiam tincidunt elementum elit. In hac habitasse platea dictumst. Nulla facilisi. Praesent molestie faucibus congue. Praesent tempus sed sapien non maximus. Quisque metus nisl, maximus ac fermentum non, lacinia at tellus. Aenean rutrum nulla augue, ut commodo dolor bibendum ac. Duis mollis ligula a sapien semper, id scelerisque nulla efficitur. Cras posuere, dui at cursus ullamcorper, tellus velit iaculis ex, sed mattis justo orci id nibh. Nulla elementum turpis ac est blandit, a feugiat quam pulvinar. Vestibulum metus velit, mollis id convallis ut, congue at enim. Sed vel nulla nec felis ultricies sodales quis in nibh.",

"Suspendisse potenti. Nullam vehicula enim at tristique posuere. Sed eget finibus mauris. Integer nec blandit ante. Praesent convallis iaculis risus vitae suscipit. Morbi nunc mi, ullamcorper quis gravida non, accumsan quis mauris. Aenean imperdiet libero quis dolor porta iaculis. Pellentesque vitae mollis arcu.",

"Maecenas eget lectus mauris. Nullam faucibus, sapien id posuere cursus, est sapien suscipit dolor, in fermentum ligula lectus eu neque. Duis at elit efficitur lectus malesuada interdum. Aenean finibus porttitor nulla vitae rhoncus. Etiam eu vulputate sem. Proin et ultrices nibh. Integer erat erat, pulvinar vel dolor quis, interdum suscipit enim. Fusce vestibulum ante at iaculis sollicitudin. Suspendisse potenti. Aenean tincidunt sit amet nunc eu venenatis. Morbi tincidunt, purus in molestie egestas, urna nibh sodales tellus, maximus volutpat lorem dui vitae diam. Mauris interdum lobortis vehicula.",

"Cras feugiat venenatis nulla eget facilisis. Suspendisse nec velit placerat, imperdiet ex at, convallis massa. Aliquam ut pulvinar risus. Sed a erat sed ligula iaculis lacinia. Vestibulum porta dignissim sagittis. Suspendisse tincidunt ullamcorper vestibulum. Ut tempus, risus dignissim iaculis scelerisque, massa nulla ultrices augue, eget sagittis sapien felis convallis nisi.",

"Ut posuere erat nibh, sed suscipit turpis efficitur quis. Aliquam dui mi, lacinia eu odio eu, tincidunt rhoncus nunc. Ut sit amet dolor sit amet nulla molestie sodales. Nullam vitae ultrices quam, ut facilisis purus. Aenean eu nunc ut lectus vulputate aliquet. Donec vel ullamcorper ipsum. Proin non dictum elit."]

5.times do |n|
  usr = User.create(name: "foobar0#{n}",
              email: "foo@bar0#{n}.com",
              password: "foobar0#{n}",
              password_confirmation: "foobar0#{n}")
  posts.each do |lorem|
    Post.create(content: lorem, user: usr)
  end
end