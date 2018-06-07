USE rvv_archive;

DROP TABLE IF EXISTS belongsTo;
DROP TABLE IF EXISTS appearsOn;
DROP TABLE IF EXISTS eventTag;
DROP TABLE IF EXISTS photoIndivTag;
DROP TABLE IF EXISTS photo;
DROP TABLE IF EXISTS attends;
DROP TABLE IF EXISTS fansite;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS member;
CREATE TABLE member
(
	mName	VARCHAR(10)	NOT NULL,
    PRIMARY KEY (mName)
);

INSERT INTO member (mName)
VALUES	("Irene"),
		("Seulgi"),
        ("Wendy"),
        ("Joy"),
        ("Yeri");

CREATE TABLE fansite
(
	fName 			VARCHAR(30)		NOT NULL,
    twitterAccount 	VARCHAR(30)		DEFAULT '-',
    twitterLink 	VARCHAR(100)	DEFAULT '-',
    twitterStartMY	VARCHAR(7)		DEFAULT '-',
    websiteLink 	VARCHAR(100)	DEFAULT '-',
    weiboName		VARCHAR(30)		DEFAULT '-',
    weiboLink		VARCHAR(100)	DEFAULT '-',
    youtubeName 	VARCHAR(20)		DEFAULT '-',
    youtubeLink 	VARCHAR(100)	DEFAULT '-',
    vimeoName		VARCHAR(30)		DEFAULT '-',
    vimeoLink		VARCHAR(100)	DEFAULT '-',
    igName			VARCHAR(30)		DEFAULT '-',
    igLink			VARCHAR(100)	DEFAULT '-',
    fStatus			VARCHAR(10)		DEFAULT 'active',
    PRIMARY KEY (fName)
);
        
CREATE TABLE event
(
	eventDate	VARCHAR(13)	NOT NULL,
    eventName	VARCHAR(50)	NOT NULL,
    PRIMARY KEY (eventDate, eventName)
);
ALTER TABLE event ADD INDEX eventName_idx (eventName);

CREATE TABLE eventTag
(
	eventDate	VARCHAR(13)	NOT NULL,
    eventName	VARCHAR(50)	NOT NULL,
    eventTag	VARCHAR(30)	NOT NULL,
    PRIMARY KEY(eventDate, eventName, eventTag),
    FOREIGN KEY (eventDate) REFERENCES event(eventDate) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (eventName) REFERENCES event(eventName) ON DELETE CASCADE ON UPDATE CASCADE    
);

CREATE TABLE belongsTo
(
	fName 			VARCHAR(30)		NOT NULL,
    member			VARCHAR(10)		NOT NULL,
    PRIMARY KEY (fName, member),
    FOREIGN KEY (fName) REFERENCES fansite(fName) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (member) REFERENCES member(mName)
);

CREATE TABLE photo
(
	pId			VARCHAR(10)		NOT NULL,
    orgLink		VARCHAR(100),
    gdLink		VARCHAR(100)	NOT NULL,
    isHQ		BOOLEAN			DEFAULT false,
    fName		VARCHAR(30)		NOT NULL,
    eventDate	VARCHAR(13)		DEFAULT '000000',
    eventName	VARCHAR(50)		DEFAULT 'Unknown',
    
    PRIMARY KEY (pId),
    FOREIGN KEY (fName) REFERENCES fansite(fName) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (eventDate) REFERENCES event(eventDate) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (eventName) REFERENCES event(eventName) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE photoIndivTag
(
	pId			VARCHAR(10)	NOT NULL,
    indivTag	VARCHAR(30)	NOT NULL,
    PRIMARY KEY (pId, indivTag),
    FOREIGN KEY (pId) REFERENCES photo(pId) ON DELETE CASCADE
);

CREATE TABLE appearsOn
(
	pId		VARCHAR(10) NOT NULL,
    member	VARCHAR(10)	NOT NULL,
    PRIMARY KEY (pId, member),
    FOREIGN KEY (member) REFERENCES member(mName)
);

CREATE TABLE attends
(
	member		VARCHAR(10) NOT NULL,
    eventDate	VARCHAR(13)	NOT NULL,
    eventName	VARCHAR(30)	NOT NULL,
    FOREIGN KEY (member) REFERENCES member(mName),
    FOREIGN KEY (eventDate) REFERENCES event(eventDate) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (eventName) REFERENCES event(eventName) ON DELETE CASCADE ON UPDATE CASCADE   
);