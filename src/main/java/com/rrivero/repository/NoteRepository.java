package com.rrivero.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.rrivero.model.Note;

/**
 * Created by rajeevkumarsingh on 27/06/17.
 */

@RepositoryRestResource
public interface NoteRepository extends JpaRepository<Note, Long> {

}
