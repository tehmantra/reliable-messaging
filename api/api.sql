/* -- rollback
DROP DATABASE Messaging;
*/
CREATE DATABASE Messaging;
GO
USE Messaging;
GO
CREATE SCHEMA Api AUTHORIZATION dbo;
GO
CREATE TABLE Api.Request (
    RequestId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Api.Event (
    EventId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    RequestId UNIQUEIDENTIFIER NOT NULL REFERENCES Api.Request (RequestId),
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    SentAt DATETIME NULL,
    [Key] VARCHAR(50) NOT NULL,
    Payload VARCHAR(MAX) NULL
);

CREATE TABLE Api.Communication (
    CommunicationId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    CustomerId UNIQUEIDENTIFIER NOT NULL,
    TemplateKey VARCHAR(50) NOT NULL,
    Payload VARCHAR(MAX) NULL
);


/*
SELECT * FROM Api.Request;
SELECT * FROM Api.Event;
SELECT * FROM Api.Communication;
*/

GO
CREATE SCHEMA Backend;
GO
CREATE TABLE Backend.Processed (
    EventId UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

/*
SELECT * FROM Backend.Processed;
*/
