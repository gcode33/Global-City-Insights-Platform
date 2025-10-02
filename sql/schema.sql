-- =========================
-- TRANSIT (GTFS Data Model)
-- =========================

-- Routes
CREATE TABLE routes (
    route_id VARCHAR PRIMARY KEY,
    agency_id VARCHAR,
    route_short_name VARCHAR,
    route_long_name VARCHAR,
    route_type INT
);

-- Stops
CREATE TABLE stops (
    stop_id VARCHAR PRIMARY KEY,
    stop_name VARCHAR,
    stop_lat DECIMAL(9,6),
    stop_lon DECIMAL(9,6)
);

-- Trips
CREATE TABLE trips (
    trip_id VARCHAR PRIMARY KEY,
    route_id VARCHAR REFERENCES routes(route_id),
    service_id VARCHAR
);

-- Stop Times
CREATE TABLE stop_times (
    stop_time_id SERIAL PRIMARY KEY,
    trip_id VARCHAR REFERENCES trips(trip_id),
    stop_id VARCHAR REFERENCES stops(stop_id),
    arrival_time VARCHAR,
    departure_time VARCHAR,
    stop_sequence INT
);

-- Calendar (service schedule)
CREATE TABLE calendar (
    service_id VARCHAR PRIMARY KEY,
    monday BOOLEAN,
    tuesday BOOLEAN,
    wednesday BOOLEAN,
    thursday BOOLEAN,
    friday BOOLEAN,
    saturday BOOLEAN,
    sunday BOOLEAN,
    start_date DATE,
    end_date DATE
);

-- =========================
-- HOUSING (Toronto Registry)
-- =========================

CREATE TABLE housing (
    building_id SERIAL PRIMARY KEY,
    rsn VARCHAR, -- Unique ID for the building
    site_address TEXT,
    pcode VARCHAR(10), -- Postal code (first 3 digits)
    ward VARCHAR,
    year_built INT,
    year_registered INT,
    property_type VARCHAR, -- Private, TCHC, Social Housing
    confirmed_storeys INT,
    confirmed_units INT,
    no_of_storeys INT,
    no_of_units INT,
    balconies BOOLEAN,
    barrier_free_accessibility BOOLEAN,
    no_barrier_free_accessible_units INT,
    no_of_accessible_parking_spaces INT,
    parking_type TEXT,
    visitor_parking TEXT,
    bike_parking TEXT,
    heating_type VARCHAR,
    heating_equipment_status VARCHAR,
    heating_equipment_year_installed INT,
    sprinkler_system BOOLEAN,
    sprinkler_system_year_installed INT,
    fire_alarm BOOLEAN,
    intercom BOOLEAN,
    amenities_available TEXT,
    description_of_child_play_area TEXT,
    description_of_indoor_exercise_room TEXT,
    description_of_outdoor_rec_facilities TEXT,
    laundry_room BOOLEAN,
    laundry_room_location TEXT,
    laundry_room_hours_of_operation TEXT,
    locker_or_storage_room BOOLEAN,
    pet_restrictions TEXT,
    pets_allowed BOOLEAN,
    air_conditioning_type VARCHAR,
    non_smoking_building BOOLEAN,
    green_bin_location TEXT,
    recycling_bins_location TEXT,
    garbage_chutes BOOLEAN,
    indoor_garbage_storage_area INT,
    outdoor_garbage_storage_area INT,
    exterior_fire_escape BOOLEAN,
    facilities_available TEXT
);

-- =========================
-- CRIME (Police Reports)
-- =========================

CREATE TABLE crime_reports (
    crime_id SERIAL PRIMARY KEY,
    report_year INT,
    division VARCHAR,
    category VARCHAR,
    subtype VARCHAR,
    count_total INT,
    count_cleared INT
);

