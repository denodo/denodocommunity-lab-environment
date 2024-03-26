-- 
-- Legal Notice 
-- 
-- This document and associated source code (the "Work") is a part of a 
-- benchmark specification maintained by the TPC. 
-- 
-- The TPC reserves all right, title, and interest to the Work as provided 
-- under U.S. and international laws, including without limitation all patent 
-- and trademark rights therein. 
-- 
-- No Warranty 
-- 
-- 1.1 TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, THE INFORMATION 
--     CONTAINED HEREIN IS PROVIDED "AS IS" AND WITH ALL FAULTS, AND THE 
--     AUTHORS AND DEVELOPERS OF THE WORK HEREBY DISCLAIM ALL OTHER 
--     WARRANTIES AND CONDITIONS, EITHER EXPRESS, IMPLIED OR STATUTORY, 
--     INCLUDING, BUT NOT LIMITED TO, ANY (IF ANY) IMPLIED WARRANTIES, 
--     DUTIES OR CONDITIONS OF MERCHANTABILITY, OF FITNESS FOR A PARTICULAR 
--     PURPOSE, OF ACCURACY OR COMPLETENESS OF RESPONSES, OF RESULTS, OF 
--     WORKMANLIKE EFFORT, OF LACK OF VIRUSES, AND OF LACK OF NEGLIGENCE. 
--     ALSO, THERE IS NO WARRANTY OR CONDITION OF TITLE, QUIET ENJOYMENT, 
--     QUIET POSSESSION, CORRESPONDENCE TO DESCRIPTION OR NON-INFRINGEMENT 
--     WITH REGARD TO THE WORK. 
-- 1.2 IN NO EVENT WILL ANY AUTHOR OR DEVELOPER OF THE WORK BE LIABLE TO 
--     ANY OTHER PARTY FOR ANY DAMAGES, INCLUDING BUT NOT LIMITED TO THE 
--     COST OF PROCURING SUBSTITUTE GOODS OR SERVICES, LOST PROFITS, LOSS 
--     OF USE, LOSS OF DATA, OR ANY INCIDENTAL, CONSEQUENTIAL, DIRECT, 
--     INDIRECT, OR SPECIAL DAMAGES WHETHER UNDER CONTRACT, TORT, WARRANTY,
--     OR OTHERWISE, ARISING IN ANY WAY OUT OF THIS OR ANY OTHER AGREEMENT 
--     RELATING TO THE WORK, WHETHER OR NOT SUCH AUTHOR OR DEVELOPER HAD 
--     ADVANCE NOTICE OF THE POSSIBILITY OF SUCH DAMAGES. 
-- 
-- Contributors:
-- Gradient Systems
--
alter table catalog_returns add constraint cr_d1 foreign key  (cr_returned_date_sk) references date_dim (d_date_sk);
alter table catalog_returns add constraint cr_i foreign key  (cr_returned_time_sk) references time_dim (t_time_sk);
alter table catalog_sales add constraint cs_d1 foreign key  (cs_ship_date_sk) references date_dim (d_date_sk);
alter table catalog_sales add constraint cs_d2 foreign key  (cs_sold_date_sk) references date_dim (d_date_sk);
alter table catalog_sales add constraint cs_t foreign key  (cs_sold_time_sk) references time_dim (t_time_sk);
alter table inventory add constraint inv_d foreign key  (inv_date_sk) references date_dim (d_date_sk);
alter table store_returns add constraint sr_ret_d foreign key  (sr_returned_date_sk) references date_dim (d_date_sk);
alter table store_returns add constraint sr_t foreign key  (sr_return_time_sk) references time_dim (t_time_sk);
alter table store_sales add constraint ss_d foreign key  (ss_sold_date_sk) references date_dim (d_date_sk);
alter table store_sales add constraint ss_t foreign key  (ss_sold_time_sk) references time_dim (t_time_sk);
alter table web_returns add constraint wr_ret_d foreign key  (wr_returned_date_sk) references date_dim (d_date_sk);
alter table web_returns add constraint wr_ret_t foreign key  (wr_returned_time_sk) references time_dim (t_time_sk);
alter table web_sales add constraint ws_s_d foreign key  (ws_ship_date_sk) references date_dim (d_date_sk);
alter table web_sales add constraint ws_d2 foreign key  (ws_sold_date_sk) references date_dim (d_date_sk);
alter table web_sales add constraint ws_t foreign key  (ws_sold_time_sk) references time_dim (t_time_sk);
