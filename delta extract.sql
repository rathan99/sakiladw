
begin;

update sakila.audit_table
set currenttimestamp = current_timestamp()
;

insert into stage_sakila.int_actor
select * from sakila.actor a
where a.last_update >= ( select lastloaded_timestamp
							from sakila.audit_table )
	and a.last_update < ( select currenttimestamp
							from sakila.audit_table )
;

update sakila.audit_table
set lastloaded_timestamp =  currenttimestamp
;

commit;