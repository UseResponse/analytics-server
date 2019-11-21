CREATE TABLE `accounts`
(
    Type UInt8,
    Token String,
    Name String,
    Url String,
    CreatedAt DateTime
)
ENGINE = Log;
