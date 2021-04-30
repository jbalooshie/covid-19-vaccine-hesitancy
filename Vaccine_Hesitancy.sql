-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/aqDqxL
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "vaccine_hesitancy_covid" (
    "fips_code" int   NOT NULL,
    "county" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "est_hesitant" decimal   NOT NULL,
    "est_strongly_hesitant" decimal   NOT NULL,
    "svi" decimal   NULL,
    "svi_category" varchar   NOT NULL,
    "cvac" decimal   NOT NULL,
    "cvac_category" varchar   NOT NULL,
    "percent_fully_vaccinated" decimal   NULL,
    "percent_hispanic" decimal   NOT NULL,
    "percent_american_indian_alaska_native" decimal   NOT NULL,
    "percent_asian" decimal   NOT NULL,
    "percent_black" decimal   NOT NULL,
    "percent_hawaiian_pacific" decimal   NOT NULL,
    "percent_white" decimal   NOT NULL,
    "geographical_point" varchar   NOT NULL,
    "state_code" varchar   NOT NULL,
    "county_boundary" varchar   NULL,
    "state_boundary" varchar   NULL,
    CONSTRAINT "pk_vaccine_hesitancy_covid" PRIMARY KEY (
        "fips_code"
     )
);

CREATE TABLE "county_statistics" (
    "fips_code" int   NOT NULL,
    "county" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "percentage16_Donald_Trump" decimal   NULL,
    "percentage16_Hillary_Clinton" decimal   NULL,
    "total_votes16" decimal   NULL,
    "votes16_Donald_Trump" decimal   NULL,
    "votes16_Hillary_Clinton" decimal   NULL,
    "percentage20_Donald_Trump" decimal   NULL,
    "percentage20_Joe_Biden" decimal   NULL,
    "total_votes20" decimal   NULL,
    "votes20_Donald_Trump" decimal   NULL,
    "votes20_Joe_Biden" decimal   NULL,
    "lat" decimal   NULL,
    "long" decimal   NULL,
    "cases" decimal   NULL,
    "deaths" decimal   NULL,
    "TotalPop" decimal   NULL,
    "Men" decimal   NULL,
    "Women" decimal   NULL,
    "Hispanic" decimal   NULL,
    "White" decimal   NULL,
    "Black" decimal   NULL,
    "Native" decimal   NULL,
    "Asian" decimal   NULL,
    "Pacific" decimal   NULL,
    "VotingAgeCitizen" decimal   NULL,
    "Income" decimal   NULL,
    "IncomeErr" decimal   NULL,
    "IncomePerCap" decimal   NULL,
    "IncomePerCapErr" decimal   NULL,
    "Poverty" decimal   NULL,
    "ChildPoverty" decimal   NULL,
    "Professional" decimal   NULL,
    "Service" decimal   NULL,
    "Office" decimal   NULL,
    "Construction" decimal   NULL,
    "Production" decimal   NULL,
    "Drive" decimal   NULL,
    "Carpool" decimal   NULL,
    "Transit" decimal   NULL,
    "Walk" decimal   NULL,
    "OtherTransp" decimal   NULL,
    "WorkAtHome" decimal   NULL,
    "MeanCommute" decimal   NULL,
    "Employed" decimal   NULL,
    "PrivateWork" decimal   NULL,
    "PublicWork" decimal   NULL,
    "SelfEmployed" decimal   NULL,
    "FamilyWork" decimal   NULL,
    "Unemployment" decimal   NULL,
    CONSTRAINT "pk_county_statistics" PRIMARY KEY (
        "fips_code"
     )
);

CREATE TABLE "census_demographic" (
    "CountyId" int   NOT NULL,
    "State" varchar   NOT NULL,
    "County" varchar   NOT NULL,
    "TotalPop" int   NOT NULL,
    "Men" int   NOT NULL,
    "Women" int   NOT NULL,
    "Hispanic" decimal   NOT NULL,
    "White" decimal   NOT NULL,
    "Black" decimal   NOT NULL,
    "Native" decimal   NOT NULL,
    "Asian" decimal   NOT NULL,
    "Pacific" decimal   NOT NULL,
    "VotingAgeCitizen" int   NOT NULL,
    "Income" int   NOT NULL,
    "IncomeErr" int   NOT NULL,
    "IncomePerCap" int   NOT NULL,
    "IncomePerCapErr" int   NOT NULL,
    "Poverty" decimal   NOT NULL,
    "ChildPoverty" decimal   NULL,
    "Professional" decimal   NOT NULL,
    "Service" decimal   NOT NULL,
    "Office" decimal   NOT NULL,
    "Construction" decimal   NOT NULL,
    "Production" decimal   NOT NULL,
    "Drive" decimal   NOT NULL,
    "Carpool" decimal   NOT NULL,
    "Transit" decimal   NOT NULL,
    "Walk" decimal   NOT NULL,
    "OtherTransp" decimal   NOT NULL,
    "WorkAtHome" decimal   NOT NULL,
    "MeanCommute" decimal   NOT NULL,
    "Employed" int   NOT NULL,
    "PrivateWork" decimal   NOT NULL,
    "PublicWork" decimal   NOT NULL,
    "SelfEmployed" decimal   NOT NULL,
    "FamilyWork" decimal   NOT NULL,
    "Unemployment" decimal   NOT NULL,
    CONSTRAINT "pk_census_demographic" PRIMARY KEY (
        "CountyId"
     )
);

CREATE TABLE "county_size" (
    "fips_code" int   NOT NULL,
    "county" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "population" int   NOT NULL,
    "density" varchar   NOT NULL,
    CONSTRAINT "pk_county_size" PRIMARY KEY (
        "fips_code"
     )
);

ALTER TABLE "vaccine_hesitancy_covid" ADD CONSTRAINT "fk_vaccine_hesitancy_covid_fips_code" FOREIGN KEY("fips_code")
REFERENCES "census_demographic" ("CountyId");

