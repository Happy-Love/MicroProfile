
# README
This README would normally document whatever steps are necessary to get the
application up and running.
Things you may want to cover:
* Ruby version
* System dependencies
* Configuration
* Database creation
* Database initialization
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions
* ...

## MicroProfile
Запускайте через ветку мастер и следуйте инструкциям
* branch master
* Сконфигурируйте web.env.
* docker-compose -f docker-compose-2.yml up
* docker-compose -f docker-compose-2.yml run web rake db:create db:migrate
* После этих шагов будет скомпилирована страница localhost:3000 (20-30 секунд, webpacker [Compiling...])
* Это всё

### Помощь при создании поста или коммента
* На localhost:3000 вы можете создать пост
* После создания первого поста, можно перейти к нему users/1/posts/1
* Там же можно создать комменты
* Количество комментариев можно увидеть на localhost:3000 так же по картинке можно перейти на пост и его комментарии    
