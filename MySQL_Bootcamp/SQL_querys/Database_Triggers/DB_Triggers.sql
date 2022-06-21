# CREATE TRIGGER name
#     trigger_time trigger_event ON name_table FOR EACH ROW
#     BEGIN
#         -- CODE 
#     END;


# DATABASE AND INFORMATION
# CREATE DATABASE trigger_demo;

USE trigger_demo;
    
CREATE TABLE users (
    username VARCHAR(100),
    age INT
);

SHOW TABLES;

INSERT INTO users(username, age) VALUES("bobby", 23);


# TRIGGER - VALIDATION
DELIMITER $$

CREATE TRIGGER must_be_adult
     BEFORE INSERT ON users FOR EACH ROW
     BEGIN
          IF NEW.age < 18
          THEN
              SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Must be an adult!';
          END IF;
     END;
$$

DELIMITER ;

# TRIGGER 2 - SELF-FOLLOWING
DELIMITER $$

CREATE TRIGGER prevent_self_follows 
    BEFORE INSERT ON follows FOR EACH ROW
    BEGIN
        IF NEW.follower_id = NEW.followee_id
        THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'You cannot follow yourself';
        END IF;
    END;

$$

DELIMITER ;

# TRIGGER 3 - LOGGING UNFOLLOWS
DELIMITER $$

CREATE TRIGGER create_unfollow
    AFTER DELETE ON follows FOR EACH ROW 
BEGIN
    INSERT INTO unfollows
    SET follower_id = OLD.follower_id,
        followee_id = OLD.followee_id;
END$$

DELIMITER ;

DELETE FROM follows WHERE follower_id = 2 AND followee_id = 1;


