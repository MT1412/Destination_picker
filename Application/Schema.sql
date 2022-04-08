-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TYPE bridge_type AS ENUM ('fixed_bridge', 'draw_bridge');
CREATE TABLE destinations (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL UNIQUE
);
CREATE TABLE sections (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    distance_km REAL NOT NULL,
    heading INT NOT NULL,
    name TEXT NOT NULL
);
CREATE TABLE route (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    destination_id UUID NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE restaurants (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    name TEXT NOT NULL UNIQUE,
    link TEXT NOT NULL,
    destination_id UUID NOT NULL
);
CREATE TABLE bridges (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    bridge_type bridge_type NOT NULL,
    name TEXT NOT NULL,
    section_id UUID NOT NULL
);
CREATE INDEX route_destination_id_index ON route (destination_id);
CREATE INDEX restaurants_destination_id_index ON restaurants (destination_id);
CREATE TABLE link_routes_sections (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    route_id UUID NOT NULL,
    section_id UUID NOT NULL
);
CREATE INDEX link_routes_sections_route_id_index ON link_routes_sections (route_id);
CREATE INDEX link_routes_sections_section_id_index ON link_routes_sections (section_id);
CREATE INDEX bridges_section_id_index ON bridges (section_id);
ALTER TABLE bridges ADD CONSTRAINT bridges_ref_section_id FOREIGN KEY (section_id) REFERENCES sections (id) ON DELETE NO ACTION;
ALTER TABLE link_routes_sections ADD CONSTRAINT link_routes_sections_ref_route_id FOREIGN KEY (route_id) REFERENCES route (id) ON DELETE NO ACTION;
ALTER TABLE link_routes_sections ADD CONSTRAINT link_routes_sections_ref_section_id FOREIGN KEY (section_id) REFERENCES sections (id) ON DELETE NO ACTION;
ALTER TABLE restaurants ADD CONSTRAINT restaurants_ref_destination_id FOREIGN KEY (destination_id) REFERENCES destinations (id) ON DELETE NO ACTION;
ALTER TABLE route ADD CONSTRAINT route_ref_destination_id FOREIGN KEY (destination_id) REFERENCES destinations (id) ON DELETE NO ACTION;
