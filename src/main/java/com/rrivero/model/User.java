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
@Table(name = "users")
@EntityListeners(AuditingEntityListener.class)
@JsonIgnoreProperties(value = {"created", "modified"}, allowGetters = true)
public class User extends CommonBaseModel{
    
    @ManyToOne(optional = false)
    @JoinColumn(name = "perfil_id")
    private Perfil perfil;

    @NotBlank
    private String name;

    @NotBlank
    private String surname;
    
    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
        name = "tasks_users", 
        joinColumns = { @JoinColumn(name = "task_id") }, 
        inverseJoinColumns = { @JoinColumn(name = "user_id") }
    )
    Set<Task> tasks = new HashSet<>();

	public Perfil getPerfil() {
		return perfil;
	}

	public void setPerfil(Perfil perfil) {
		this.perfil = perfil;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSurname() {
		return surname;
	}

	public void setSurname(String surname) {
		this.surname = surname;
	}

	public Set<Task> getTasks() {
		return tasks;
	}

	public void setTasks(Set<Task> tasks) {
		this.tasks = tasks;
	}

}
