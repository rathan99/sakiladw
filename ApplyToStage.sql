
begin;

update  stage_sakila.stg_actor sa
join stage_sakila.int_actor ia on sa.actor_id = ia.actor_id
set sa.first_name = ia.first_name
;

insert into stage_sakila.stg_actor
select * from stage_sakila.int_actor ia
where not exists (select actor_id 
					from stage_sakila.stg_actor sa  
                    where ia.actor_id = sa.actor_id )
;

delete from stage_sakila.int_actor
;

commit;

