prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050100 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.4.00.08'
,p_default_workspace_id=>1810418193191039
,p_default_application_id=>101
,p_default_owner=>'ADMIN'
);
end;
/
prompt --application/shared_components/plugins/item_type/uppercase
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(7689388984888282)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'UPPERCASE'
,p_display_name=>'Convert_Case'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_javascript_file_urls=>'https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'PROCEDURE   RENDER_UPPER_CASE(',
'p_item in apex_plugin.t_item,',
'p_plugin in apex_plugin.t_plugin,',
'p_param in apex_plugin.t_item_render_param,',
'p_result in out nocopy apex_plugin.t_item_render_result',
')',
'AS',
'v_result          apex_plugin.t_page_item_render_result;',
'lv_id varchar2(100) := p_item.attribute_01;',
'lv_item_name varchar2(1000) := apex_plugin.get_input_name_for_page_item(TRUE);',
'l_result           APEX_PLUGIN.T_PAGE_ITEM_RENDER_RESULT;',
'',
'BEGIN',
'sys.htp.prn(''<script>'');',
'sys.htp.prn(''function myFunction() {',
' var x = document.getElementById("''||p_item.name||''");',
'  x.value = x.value.toUpperCase();} '' );',
'sys.htp.prn(''</script> '');',
'sys.htp.prn(''<input'');',
'sys.htp.prn('' type="text"'');',
'sys.htp.prn('' id="'' || p_item.name || ''"'');',
'sys.htp.prn('' onkeyup="myFunction()"'');',
'sys.htp.prn('' name="'' || p_item.name || ''"'');',
'sys.htp.prn('' class="apex-item-text ''|| p_item.element_css_classes || ''"'');',
'sys.htp.prn(case when p_item.is_required then '' required'' else null end);',
'sys.htp.prn('' size="'' || p_item.element_width || ''"'');',
'sys.htp.prn('' placeholder="'' || p_item.placeholder || ''"'');',
'sys.htp.prn('' value="'');',
'sys.htp.prn(p_param.value);',
'sys.htp.prn(''"'');',
'sys.htp.prn(''/>'');',
'',
'END;',
''))
,p_api_version=>2
,p_render_function=>'RENDER_UPPER_CASE'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:READONLY:QUICKPICK:ELEMENT:HEIGHT:PLACEHOLDER:ICON:ENCRYPT:LINK:INIT_JAVASCRIPT_CODE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>12
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(7689580269888300)
,p_plugin_id=>wwv_flow_api.id(7689388984888282)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
