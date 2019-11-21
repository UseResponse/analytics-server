CREATE TABLE `--DATABASE--`.`reply_time`
(
    AuthorId UInt32,
    Author String,
    ObjectId UInt32,
    Object String,
    IsFirst UInt8,
    IsAgent UInt8,
    RepeatDelay UInt32,
    Duration UInt32,
    BusinessHours UInt32,
    EventDate Date,
	  CreatedAt DateTime
)
ENGINE = MergeTree(EventDate, AuthorId, 8192);

CREATE TABLE `--DATABASE--`.`csat`
(
    AgentId UInt32,
    ObjectId UInt32,
    Object String,
    Score UInt8,
    EventDate Date,
	  CreatedAt DateTime
)
ENGINE = ReplacingMergeTree(EventDate, ObjectId, 8192);

CREATE TABLE `--DATABASE--`.`changelog`
(
    AuthorId UInt32,
    Author String,
    ObjectId UInt32,
    Object String,
    PreviousAction String,
    CurrentAction String,
    PreviousDate String,
    Duration String,
    BusinessHours String,
    FirstComplete UInt8,
    EventDate Date,
	  CreatedAt DateTime
)
ENGINE = MergeTree(EventDate, ObjectId, 8192);

CREATE TABLE `--DATABASE--`.`sla`
(
    ObjectId UInt32,
    Object String,
    EventDate Date,
	  CreatedAt DateTime,
	  ExpiresAt DateTime
)
ENGINE = MergeTree(EventDate, ObjectId, 8192);

CREATE TABLE `--DATABASE--`.`activity`
(
    ObjectId UInt32,
    Object String,
    LogId UInt32,
    AuthorId UInt32,
    Action String,
    EventDate Date,
	  CreatedAt DateTime
)
ENGINE = MergeTree(EventDate, ObjectId, 8192);

CREATE TABLE `--DATABASE--`.`views`
(
    ObjectId UInt32,
    Object String,
    Author String,
    AuthorId UInt32,
    IsAgent UInt8,
    EventDate Date,
	  CreatedAt DateTime
)
ENGINE = MergeTree(EventDate, (ObjectId, AuthorId), 8192);

CREATE TABLE `--DATABASE--`.`votes`
(
    ObjectId UInt32,
    Object String,
    VoteId UInt32,
    Author String,
    AuthorId UInt32,
    IsAgent UInt8,
    Value UInt8,
    EventDate Date,
	  CreatedAt DateTime
)
ENGINE = ReplacingMergeTree(EventDate, VoteId, 8192);

CREATE TABLE `--DATABASE--`.`settings`
(
    Name String,
    Value String
)
ENGINE = Log;

CREATE TABLE `--DATABASE--`.`search_queries`
(
    AuthorId UInt32,
    Author String,
    Keyword String,
    Phrase String,
    Token String,
    EventDate Date,
	  CreatedAt DateTime
)
ENGINE = MergeTree(EventDate, Token, 8192);

CREATE TABLE `--DATABASE--`.`search_results`
(
    Token String,
    ObjectId UInt32,
    EventType UInt8,
    Position UInt32,
    EventDate Date,
	  CreatedAt DateTime
)
ENGINE = MergeTree(EventDate, (Token, ObjectId, EventType), 8192);
