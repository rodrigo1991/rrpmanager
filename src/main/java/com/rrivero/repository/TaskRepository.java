package com.rrivero.repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import com.rrivero.model.Task;

/**
 * Created by rajeevkumarsingh on 27/06/17.
 */

@RepositoryRestResource
public interface TaskRepository extends JpaRepository<Task, Long> {

}
