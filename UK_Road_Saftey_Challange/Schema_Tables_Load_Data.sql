CREATE DATABASE UK_Road_Safty_Accidents_2016;

USE UK_Road_Safty_Accidents_2016;

-- + ----------------------------------------------------------- + --

-- TODO: Create tables:-

CREATE TABLE accident (
	accident_index VARCHAR(13) NOT NULL, 
	accident_year DECIMAL(38, 0) NOT NULL, 
	accident_reference VARCHAR(9) NOT NULL, 
	location_easting_osgr DECIMAL(38, 0), 
	location_northing_osgr DECIMAL(38, 0), 
	longitude DECIMAL(38, 6), 
	latitude DECIMAL(38, 6), 
	police_force DECIMAL(38, 0) NOT NULL, 
	accident_severity DECIMAL(38, 0) NOT NULL, 
	number_of_vehicles DECIMAL(38, 0) NOT NULL, 
	number_of_casualties DECIMAL(38, 0) NOT NULL, 
	date VARCHAR(10) NOT NULL, 
	day_of_week DECIMAL(38, 0) NOT NULL, 
	time VARCHAR(10) NOT NULL, 
	local_authority_district DECIMAL(38, 0) NOT NULL, 
	local_authority_ons_district VARCHAR(9) NOT NULL, 
	local_authority_highway VARCHAR(9) NOT NULL, 
	first_road_class DECIMAL(38, 0) NOT NULL, 
	first_road_number DECIMAL(38, 0) NOT NULL, 
	road_type DECIMAL(38, 0) NOT NULL, 
	speed_limit DECIMAL(38, 0), 
	junction_detail DECIMAL(38, 0) NOT NULL, 
	junction_control DECIMAL(38, 0) NOT NULL, 
	second_road_class DECIMAL(38, 0) NOT NULL, 
	second_road_number DECIMAL(38, 0) NOT NULL, 
	pedestrian_crossing_human_control DECIMAL(38, 0) NOT NULL, 
	pedestrian_crossing_physical_facilities DECIMAL(38, 0) NOT NULL, 
	light_conditions DECIMAL(38, 0) NOT NULL, 
	weather_conditions DECIMAL(38, 0) NOT NULL, 
	road_surface_conditions DECIMAL(38, 0) NOT NULL, 
	special_conditions_at_site DECIMAL(38, 0) NOT NULL, 
	carriageway_hazards DECIMAL(38, 0) NOT NULL, 
	urban_or_rural_area DECIMAL(38, 0) NOT NULL, 
	did_police_officer_attend_scene_of_accident DECIMAL(38, 0) NOT NULL, 
	trunk_road_flag DECIMAL(38, 0) NOT NULL, 
	lsoa_of_accident_location VARCHAR(9) NOT NULL
);

CREATE TABLE vehicle (
	accident_index VARCHAR(13) NOT NULL, 
	accident_year DECIMAL(38, 0) NOT NULL, 
	accident_reference VARCHAR(9) NOT NULL, 
	vehicle_reference DECIMAL(38, 0) NOT NULL, 
	vehicle_type DECIMAL(38, 0) NOT NULL, 
	towing_and_articulation DECIMAL(38, 0) NOT NULL, 
	vehicle_manoeuvre DECIMAL(38, 0) NOT NULL, 
	vehicle_direction_from DECIMAL(38, 0) NOT NULL, 
	vehicle_direction_to DECIMAL(38, 0) NOT NULL, 
	vehicle_location_restricted_lane DECIMAL(38, 0) NOT NULL, 
	junction_location DECIMAL(38, 0) NOT NULL, 
	skidding_and_overturning DECIMAL(38, 0) NOT NULL, 
	hit_object_in_carriageway DECIMAL(38, 0) NOT NULL, 
	vehicle_leaving_carriageway DECIMAL(38, 0) NOT NULL, 
	hit_object_off_carriageway DECIMAL(38, 0) NOT NULL, 
	first_point_of_impact DECIMAL(38, 0) NOT NULL, 
	vehicle_left_hand_drive DECIMAL(38, 0) NOT NULL, 
	journey_purpose_of_driver DECIMAL(38, 0) NOT NULL, 
	sex_of_driver DECIMAL(38, 0) NOT NULL, 
	age_of_driver DECIMAL(38, 0) NOT NULL, 
	age_band_of_driver DECIMAL(38, 0) NOT NULL, 
	engine_capacity_cc DECIMAL(38, 0) NOT NULL, 
	propulsion_code DECIMAL(38, 0) NOT NULL, 
	age_of_vehicle DECIMAL(38, 0) NOT NULL, 
	generic_make_model DECIMAL(38, 0) NOT NULL, 
	driver_imd_decile DECIMAL(38, 0) NOT NULL, 
	driver_home_area_type DECIMAL(38, 0) NOT NULL
);

CREATE TABLE vehicle_type(
	vehicle_code INT,
    vehicle_type VARCHAR(50)
);

-- + ----------------------------------------------------------- + --

-- TODO: Load data:-

LOAD DATA INFILE "C:\\Accidents-2016.csv"
INTO TABLE accident
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE "C:\\Vehicles-2016.csv"
INTO TABLE vehicle
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

LOAD DATA INFILE 'C:\\vehicle_types.csv'
INTO TABLE vehicle_type
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- + ----------------------------------------------------------- + --
