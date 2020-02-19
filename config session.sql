alter session set nls_numeric_characters	= '.,';
alter session set nls_language 				= upper('brazilian portuguese');
alter session set nls_date_language 		= upper('portuguese');
alter session set nls_date_format 			= upper('dd/mm/rrrr');

select parameter, value from nls_session_parameters
where parameter = upper('nls_numeric_characters');