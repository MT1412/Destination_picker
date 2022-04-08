ALTER TABLE restaurants ADD COLUMN destination_id UUID NOT NULL;
ALTER TABLE route ADD COLUMN destination_id UUID NOT NULL;
ALTER TABLE sections ADD COLUMN name TEXT NOT NULL;
CREATE INDEX route_destination_id_index ON route (destination_id);
CREATE INDEX restaurants_destination_id_index ON restaurants (destination_id);
CREATE TABLE link_routes_sections (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    route_id UUID NOT NULL,
    section_id UUID NOT NULL
);
CREATE INDEX link_routes_sections_route_id_index ON link_routes_sections (route_id);
CREATE INDEX link_routes_sections_section_id_index ON link_routes_sections (section_id);
ALTER TABLE link_routes_sections ADD CONSTRAINT link_routes_sections_ref_route_id FOREIGN KEY (route_id) REFERENCES route (id) ON DELETE NO ACTION;
ALTER TABLE link_routes_sections ADD CONSTRAINT link_routes_sections_ref_section_id FOREIGN KEY (section_id) REFERENCES sections (id) ON DELETE NO ACTION;
ALTER TABLE restaurants ADD CONSTRAINT restaurants_ref_destination_id FOREIGN KEY (destination_id) REFERENCES destinations (id) ON DELETE NO ACTION;
ALTER TABLE route ADD CONSTRAINT route_ref_destination_id FOREIGN KEY (destination_id) REFERENCES destinations (id) ON DELETE NO ACTION;
