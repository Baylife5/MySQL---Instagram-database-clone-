CREATE DATABASE IG_Clone;

USE IG_Clone

CREATE TABLE user(

    id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE photos(

    id INT AUTO_INCREMENT PRIMARY KEY,
    photo_url VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    user_id INT NOT NULL,
    FOREIGN KEY(user_id) REFERENCES user(id)
);


CREATE TABLE comments(

    comments_id INT AUTO_INCREMENT PRIMARY KEY,
    photo_id INT NOT NULL,
    user_id INT NOT NULL,
    comment_text VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(user_id) REFERENCES user(id),
    FOREIGN KEY(photo_id)  REFERENCES photos(id)
);


CREATE TABLE followers(

    follower_id INT NOT NULL,
    followee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(follower_id) REFERENCES user(id),
    FOREIGN KEY(followee_id) REFERENCES user(id),
    PRIMARY KEY(follower_id,followee_id)
);

CREATE TABLE unfollows(

    unfollower_id INT NOT NULL,
    unfollowee_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(unfollower_id) REFERENCES user(id),
    FOREIGN KEY(unfollowee_id) REFERENCES user(id),
    PRIMARY KEY(unfollower_id,unfollowee_id)
);


CREATE TABLE likes(

    followee_id INT NOT NULL, 
    photo_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT NOW(),
    FOREIGN KEY(followee_id) REFERENCES user(id),
    FOREIGN KEY(photo_id) REFERENCES photos(id),
    PRIMARY KEY(followee_id,photo_id)
);


CREATE TABLE tags(

    hash_id INT AUTO_INCREMENT PRIMARY KEY,
    tag VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE photo_hash_tags(

        photo_id INT NOT NULL,
        tag_id INT NOT NULL,
        FOREIGN KEY(photo_id) REFERENCES photos(id),
        FOREIGN KEY(tag_id)  REFERENCES tags(hash_id),
        PRIMARY KEY(photo_id,tag_id)

);


