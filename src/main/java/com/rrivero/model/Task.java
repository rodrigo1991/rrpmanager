package com.rrivero.model;



import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tasks")
@EntityListeners(AuditingEntityListener.class)
@JsonIgnoreProperties(value = {"created", "modified"}, allowGetters = true)
public class Task extends CommonBaseModel{
    
    @ManyToOne(optional = false)
    @JoinColumn(name = "project_id")
    private Project project;

    @NotBlank
    private String name;

    @NotBlank
    private String description;
    
    private double duration;
    
    @ManyToMany(mappedBy = "tasks")
    Set<User> users = new HashSet<>();

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getDuration() {
		return duration;
	}

	public void setDuration(double duration) {
		this.duration = duration;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setUsers(Set<User> projects) {
		this.users = projects;
	}

   
}
