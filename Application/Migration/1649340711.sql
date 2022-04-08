ALTER TABLE bridges ADD COLUMN section_id UUID NOT NULL;
CREATE INDEX bridges_section_id_index ON bridges (section_id);
ALTER TABLE bridges ADD CONSTRAINT bridges_ref_section_id FOREIGN KEY (section_id) REFERENCES sections (id) ON DELETE NO ACTION;
