CREATE TABLE dbo.DimArea (
    AreaKey       INT IDENTITY PRIMARY KEY,
    AreaCode      NVARCHAR(50),
    AreaName      NVARCHAR(100),
    Continent     NVARCHAR(50)
);

CREATE TABLE dbo.DimItem (
    ItemKey       INT IDENTITY PRIMARY KEY,
    ItemCode      NVARCHAR(50),
    ItemName      NVARCHAR(200),
    Domain        NVARCHAR(200),
    Description   NVARCHAR(MAX)
);

CREATE TABLE dbo.DimElement (
    ElementKey    INT IDENTITY PRIMARY KEY,
    ElementCode   NVARCHAR(50),
    ElementName   NVARCHAR(200),
    UnitDefault   NVARCHAR(50)
);

CREATE TABLE dbo.DimUnit (
    UnitKey       INT IDENTITY PRIMARY KEY,
    UnitName      NVARCHAR(50),
    UnitDesc      NVARCHAR(200)
);

CREATE TABLE dbo.DimFlag (
    FlagKey       INT IDENTITY PRIMARY KEY,
    FlagCode      NVARCHAR(5) UNIQUE,
    FlagMeaning   NVARCHAR(200)
);

CREATE TABLE dbo.DimDate (
    DateKey       INT PRIMARY KEY,
    YearLabel     CHAR(4)
);


CREATE TABLE dbo.FactProduction (
    ProductionKey BIGINT IDENTITY PRIMARY KEY,
    DateKey       INT          NOT NULL FOREIGN KEY REFERENCES dbo.DimDate(DateKey),
    AreaKey       INT          NOT NULL FOREIGN KEY REFERENCES dbo.DimArea(AreaKey),
    ItemKey       INT          NOT NULL FOREIGN KEY REFERENCES dbo.DimItem(ItemKey),
    ElementKey    INT          NOT NULL FOREIGN KEY REFERENCES dbo.DimElement(ElementKey),
    UnitKey       INT          NOT NULL FOREIGN KEY REFERENCES dbo.DimUnit(UnitKey),
    FlagKey       INT  NULL    FOREIGN KEY REFERENCES dbo.DimFlag(FlagKey),
    Value         NVARCHAR(200)
);