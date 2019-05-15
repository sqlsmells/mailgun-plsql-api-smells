prompt uninstall.sql
-- v0.6

prompt drop job (process queue)
begin dbms_scheduler.stop_job ('mailgun_process_queue'); exception when others then if sqlcode not in (-27366,-27475) then raise; end if; end;
/
begin dbms_scheduler.drop_job('mailgun_process_queue'); exception when others then if sqlcode not in (-27366,-27475) then raise; end if; end;
/

prompt drop job (purge logs)
begin dbms_scheduler.stop_job ('mailgun_purge_logs'); exception when others then if sqlcode not in (-27366,-27475) then raise; end if; end;
/
begin dbms_scheduler.drop_job('mailgun_purge_logs'); exception when others then if sqlcode not in (-27366,-27475) then raise; end if; end;
/

prompt drop queue
begin dbms_aqadm.stop_queue (user||'.mailgun_queue'); exception when others then if sqlcode!=-24010 then raise; end if; end;
/
begin dbms_aqadm.drop_queue (user||'.mailgun_queue'); exception when others then if sqlcode!=-24010 then raise; end if; end;
/
begin dbms_aqadm.drop_queue_table (user||'.mailgun_queue_tab'); exception when others then if sqlcode not in (-24010,-24002) then raise; end if; end;
/

prompt drop tables
begin execute immediate 'drop table mailgun_email_log'; exception when others then if sqlcode!=-942 then raise; end if; end;
/
begin execute immediate 'drop table mailgun_settings'; exception when others then if sqlcode!=-942 then raise; end if; end;
/

prompt drop types
begin execute immediate 'drop type t_mailgun_attachment_arr'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_recipient_arr'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_event_arr'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_stat_arr'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_suppression_arr'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_tag_arr'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_email'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_attachment'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_recipient'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_event'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_stat'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_suppression'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/
begin execute immediate 'drop type t_mailgun_tag'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/

prompt drop package
begin execute immediate 'drop package mailgun_pkg'; exception when others then if sqlcode!=-4043 then raise; end if; end;
/

prompt finished.