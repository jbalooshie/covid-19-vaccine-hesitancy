-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "vaccine_hesitancy_covid" (
    "fips_code" int   NOT NULL,
    "county" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "est_hesitant" decimal   NOT NULL,
    "est_strongly_hesitant" decimal   NOT NULL,
    "svi" decimal   NOT NULL,
    "svi_category" varchar   NOT NULL,
    "cvac" decimal   NOT NULL,
    "cvac_category" varchar   NOT NULL,
    "percent_fully_vaccinated" decimal   NOT NULL,
    "percent_hispanic" decimal   NOT NULL,
    "percent_american_indian_alaska_native" decimal   NOT NULL,
    "percent_asian" decimal   NOT NULL,
    "percent_black" decimal   NOT NULL,
    "percent_hawaiian_pacific" decimal   NOT NULL,
    "percent_white" decimal   NOT NULL,
    "geographical_point" varchar   NOT NULL,
    "state_code" varchar   NOT NULL,
    "county_boundary" varchar   NOT NULL,
    "state_boundary" varchar   NOT NULL,
    CONSTRAINT "pk_vaccine_hesitancy_covid" PRIMARY KEY (
        "fips_code"
     )
);

CREATE TABLE "county_state" (
    "county" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "fips_code" varchar   NOT NULL,
    CONSTRAINT "pk_county_state" PRIMARY KEY (
        "county","state"
     )
);

CREATE TABLE "county_statistics" (
    "county" varchar   NOT NULL,
    "state" varchar   NOT NULL,
    "percentage16_Donald_Trump" decimal   NOT NULL,
    "percentage16_Hillary_Clinton" decimal   NOT NULL,
    "total_votes16" decimal   NOT NULL,
    "votes16_Donald_Trump" decimal   NOT NULL,
    "votes16_Hillary_Clinton" decimal   NOT NULL,
    "percentage20_Donald_Trump" decimal   NOT NULL,
    "percentage20_Joe_Biden" decimal   NOT NULL,
    "total_votes20" decimal   NOT NULL,
    "votes20_Donald_Trump" decimal   NOT NULL,
    "votes20_Joe_Biden" decimal   NOT NULL,
    "lat" decimal   NOT NULL,
    "long" decimal   NOT NULL,
    "cases" decimal   NOT NULL,
    "deaths" decimal   NOT NULL,
    "TotalPop" decimal   NOT NULL,
    "Men" decimal   NOT NULL,
    "Women" decimal   NOT NULL,
    "Hispanic" decimal   NOT NULL,
    "White" decimal   NOT NULL,
    "Black" decimal   NOT NULL,
    "Native" decimal   NOT NULL,
    "Asian" decimal   NOT NULL,
    "Pacific" decimal   NOT NULL,
    "VotingAgeCitizen" decimal   NOT NULL,
    "Income" decimal   NOT NULL,
    "IncomeErr" decimal   NOT NULL,
    "IncomePerCap" decimal   NOT NULL,
    "IncomePerCapErr" decimal   NOT NULL,
    "Poverty" decimal   NOT NULL,
    "ChildPoverty" decimal   NOT NULL,
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
    "Employed" decimal   NOT NULL,
    "PrivateWork" decimal   NOT NULL,
    "PublicWork" decimal   NOT NULL,
    "SelfEmployed" decimal   NOT NULL,
    "FamilyWork" decimal   NOT NULL,
    "Unemployment" decimal   NOT NULL,
    CONSTRAINT "pk_county_statistics" PRIMARY KEY (
        "county","state"
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
    "ChildPoverty" decimal   NOT NULL,
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

ALTER TABLE "county_state" ADD CONSTRAINT "fk_county_state_fips_code" FOREIGN KEY("fips_code")
REFERENCES "vaccine_hesitancy_covid" ("fips_code");

ALTER TABLE "county_statistics" ADD CONSTRAINT "fk_county_statistics_county_state" FOREIGN KEY("county", "state")
REFERENCES "county_state" ("county", "state");

ALTER TABLE "census_demographic" ADD CONSTRAINT "fk_census_demographic_CountyId" FOREIGN KEY("CountyId")
REFERENCES "vaccine_hesitancy_covid" ("fips_code");

