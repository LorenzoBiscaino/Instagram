-- création table users
CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15) UNIQUE,
    mot_de_passe VARCHAR(50) NOT NULL,
    avatar VARCHAR(100),
    bio VARCHAR(200),
    CONSTRAINT email_phone_notnull CHECK(
        NOT(
            (email IS NULL OR email='')
            AND
            (phone IS NULL OR phone='')
        )
    )
);

--création table photos
CREATE TABLE IF NOT EXISTS photos(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    url VARCHAR(100) NOT NULL,
    legende VARCHAR(200),
    latitude INT CHECK (latitude<90 AND latitude>-90),
    longitude INT CHECK (longitude<180 AND longitude>-180)
);

--création table commentaire
CREATE TABLE IF NOT EXISTS commentaires(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    photo_id INT REFERENCES photos(id) ON DELETE CASCADE,
    contenu VARCHAR(300)
);

--création table like
CREATE TABLE IF NOT EXISTS likes(
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id) ON DELETE CASCADE,
    photo_id INT REFERENCES photos(id) ON DELETE CASCADE,
    commentaire_id INT REFERENCES commentaires(id) ON DELETE CASCADE,
    CONSTRAINT photo_id_commentaire_id_notnull CHECK(
        NOT(
            (photo_id IS NULL)
            AND
            (commentaire_id IS NULL)
        )
    ),
    CONSTRAINT photo_id_commentaire_id_both_notnull CHECK(
            NOT(
                (photo_id IS NOT NULL)
                AND
                (commentaire_id IS NOT NULL)
            )
        
    )
);

--création table follow
CREATE TABLE IF NOT EXISTS follows(
    id SERIAL PRIMARY KEY,
    follower_id INT REFERENCES users(id) ON DELETE CASCADE,
    followed_id INT CHECK (followed_id!=follower_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE (follower_id,followed_id)
);

--insertion table users
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Rees', 'Phinnessy', 'rphinnessy0', 'rphinnessy0@sina.com.cn', 'tDkdj9V', 'https://robohash.org/explicabofacilisdolores.jpg?size=50x50&set=set1', 'Caribbean Pine', null);
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Haily', 'Loveman', 'hloveman1', 'hloveman1@cisco.com', 'qEc7Y2', 'https://robohash.org/quisitaquequisquam.jpg?size=50x50&set=set1', 'American Pistachio', '+359 958 135 05');
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Carmine', 'Sidey', 'csidey2', 'csidey2@furl.net', '8nNWOXWJ8', 'https://robohash.org/velutsunt.jpg?size=50x50&set=set1', 'Skin Lichen', null);
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Sanders', 'Livings', 'slivings3', 'slivings3@sciencedaily.com', 'XjKZav7', 'https://robohash.org/quoveroeos.jpg?size=50x50&set=set1', 'Krug''s Roughleaf', '+86 254 183 32');
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Heindrick', 'Gollin', 'hgollin4', 'hgollin4@jimdo.com', '2vzGXC', 'https://robohash.org/indoloremquenesciunt.jpg?size=50x50&set=set1', 'Panicgrass', '+52 410 834 06');
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Davon', 'Smurfitt', 'dsmurfitt5', 'dsmurfitt5@about.com', 'ykM2b7', 'https://robohash.org/enimsintvel.jpg?size=50x50&set=set1', 'Scented Oakfern', null);
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Faydra', 'Conway', 'fconway6', 'fconway6@time.com', 'TnLbNmGNTtU', 'https://robohash.org/utexplicabosit.jpg?size=50x50&set=set1', 'Compact Dodder', '+1 153 702 18');
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Berna', 'Britney', 'bbritney7', 'bbritney7@baidu.com', 'r8W0iU', 'https://robohash.org/estaliquidquas.jpg?size=50x50&set=set1', 'Parasitic Lady''s Tresses', '+86 848 861 48');
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Ben', 'Elcomb', 'belcomb8', 'belcomb8@virginia.edu', 'qbG8JDncbN', 'https://robohash.org/rationeetmolestiae.jpg?size=50x50&set=set1', 'Chinese Box-orange', '+86 882 100 02');
insert into users (first_name, last_name, username, email, mot_de_passe, avatar, bio, phone) values ('Robyn', 'Gocher', 'rgocher9', 'rgocher9@ucoz.com', 'NYxzdAAC2V', 'https://robohash.org/etvoluptasdignissimos.jpg?size=50x50&set=set1', 'Hybrid Honeylocust', '+51 276 960 89');

--insertion table photos
insert into photos (user_id, url, legende, latitude, longitude) values (3, 'https://nesciuntquifuga.jpg', 'wow', -37, 8);
insert into photos (user_id, url, legende, latitude, longitude) values (8, 'https://idaperiamvoluptatibus.jpg', 'So cool', 31, -149);
insert into photos (user_id, url, legende, latitude, longitude) values (3, 'https://debitisestdeserunt.jpg', 'Great day', -31, -5);
insert into photos (user_id, url, legende, latitude, longitude) values (5, 'https://quaeratvoluptasquae.jpg', 'Nice', -42, 140);
insert into photos (user_id, url, legende, latitude, longitude) values (4, 'https://distinctiovoluptasnatus.jpg', 'I Love It', -89, -35);
insert into photos (user_id, url, legende, latitude, longitude) values (3, 'https://quoseumvoluptas.jpg', 'Wonderfull', -27, 124);
insert into photos (user_id, url, legende, latitude, longitude) values (9, 'https://aliquidipsaconsequuntur.jpg', 'Such a shame', 39, 147);
insert into photos (user_id, url, legende, latitude, longitude) values (3, 'https://consequaturvoluptatequia.jpg', 'I love it', -43, -42);
insert into photos (user_id, url, legende, latitude, longitude) values (8, 'https://liberoautat.jpg', 'Really good', 26, -6);
insert into photos (user_id, url, legende, latitude, longitude) values (6, 'https://ipsavoluptasiusto.jpg', 'You are pretty', -52, -23);


--insertion table commentaires
INSERT INTO commentaires(user_id,photo_id,contenu)
VALUES
(5,6,'commentaire1'),
(6,15,'commentaire2'),
(9,8,'commentaire3'),
(4,13,'commentaire4'),
(2,10,'commentaire5'),
(9,12,'commentaire6'),
(11,9,'commentaire7'),
(7,11,'commentaire8'),
(10,6,'commentaire9'),
(7,14,'commentaire10');

--insertion table likes
insert into likes (user_id, photo_id, commentaire_id) values (5, null, 4);
insert into likes (user_id, photo_id, commentaire_id) values (8, 10, null);
insert into likes (user_id, photo_id, commentaire_id) values (11, null, 9);
insert into likes (user_id, photo_id, commentaire_id) values (5, 9, null);
insert into likes (user_id, photo_id, commentaire_id) values (2, null, 7);
insert into likes (user_id, photo_id, commentaire_id) values (8, 11, null);
insert into likes (user_id, photo_id, commentaire_id) values (8, null, 2);
insert into likes (user_id, photo_id, commentaire_id) values (9, 15, null);
insert into likes (user_id, photo_id, commentaire_id) values (6, null, 2);
insert into likes (user_id, photo_id, commentaire_id) values (2, 9, null);


--insertion table follow
insert into follows (follower_id, followed_id) values (9, 7);
insert into follows (follower_id, followed_id) values (4, 2);
insert into follows (follower_id, followed_id) values (5, 11);
insert into follows (follower_id, followed_id) values (8, 2);
insert into follows (follower_id, followed_id) values (4, 3);
insert into follows (follower_id, followed_id) values (3, 11);
insert into follows (follower_id, followed_id) values (5, 9);
insert into follows (follower_id, followed_id) values (9, 4);
insert into follows (follower_id, followed_id) values (2, 3);
insert into follows (follower_id, followed_id) values (9, 2);


--Pour tous les commentaires, montrer le contenu et le username de l'auteur
SELECT commentaires.contenu,users.username 
FROM commentaires JOIN users 
ON commentaires.user_id= users.id;

-- Pour chaque commentaire, afficher son contenu et l'url de la photo à laquelle le commentaire a été ajouté
SELECT commentaires.contenu, photos.url FROM commentaires JOIN photos ON photos.id=commentaires.photo_id;

-- Afficher l'url de chaque photo et le nom d'utilisateur de l'auteur
SELECT p.url, u.username
FROM photos p JOIN users u
ON p.user_id=u.id;

-- Trouver tous les commentaires pour la photo d'id 3, avec le username de l'utilisateur qui a commenté
SELECT commentaires.contenu AS contenu_commentaire,
       users.username AS username_utilisateur
        FROM commentaires
              JOIN users ON user_id=users.id
WHERE photo_id = 3;

-- Trouver tous les url des photos ainsi que tous les commentaires qui ont été posté par l'auteur de la photo
SELECT photos.url,commentaires.contenu
FROM users 
JOIN photos ON photos.user_id=users.id
JOIN commentaires ON commentaires.user_id=users.id;

-- A l'exercice précédent afficher aussi le nom de l'utilisateur qui a commenté ses propres photos
SELECT photos.url,commentaires.contenu,users.username,photos.user_id,commentaires.user_id
FROM users 
JOIN photos ON photos.user_id=users.id
JOIN commentaires ON commentaires.user_id=users.id;

-- Le nombre de likes pour la photo d’ID 4
SELECT COUNT(id) AS nombre_likes_photo_4
FROM likes
WHERE photo_id=4;

