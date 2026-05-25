using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Linq;

/// <summary>
/// Summary description for BAL_Forms
/// </summary>
public class BAL_Forms
{
    public BAL_Forms()
    {

    }
    public static DataSet dis_agent_application(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_agent_application_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet sel_agent_application(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_agent_application_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_agent_app_form(string register_buissness_name, string trading_name, string abn, string proprietor_directors_name, string year_established, string website, string email, string phone, string country_code, string contact, string address, string postal_address, string employed_agents_names, string services_international_student, string staff_count, string staff_name, string service, string fee, string agent_association_details, string referral_origin_countries, string staff_update_plan, string partner_institution_details, string contact_person_name_number, string contact_person_email, string full_name, string position, string signature, string signature_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_agent_app_form_sp";
        cmd.CommandType = CommandType.StoredProcedure;

        // Create an instance of the Parameter class
        parameter param = new parameter();

        // Add parameters using the Parameter class
        cmd.Parameters.Add(param.stringparam("@register_buissness_name", register_buissness_name));
        cmd.Parameters.Add(param.stringparam("@trading_name", trading_name));
        cmd.Parameters.Add(param.stringparam("@abn", abn));
        cmd.Parameters.Add(param.stringparam("@proprietor_directors_name", proprietor_directors_name));
        cmd.Parameters.Add(param.stringparam("@year_established", year_established));
        cmd.Parameters.Add(param.stringparam("@website", website));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@phone", phone));
        cmd.Parameters.Add(param.stringparam("@country_code", country_code));
        cmd.Parameters.Add(param.stringparam("@contact", contact));
        cmd.Parameters.Add(param.stringparam("@address", address));
        cmd.Parameters.Add(param.stringparam("@postal_address", postal_address));
        cmd.Parameters.Add(param.stringparam("@employed_agents_names", employed_agents_names));
        cmd.Parameters.Add(param.stringparam("@services_international_student", services_international_student));
        cmd.Parameters.Add(param.stringparam("@staff_count", staff_count));
        cmd.Parameters.Add(param.stringparam("@staff_name", staff_name));
        cmd.Parameters.Add(param.stringparam("@service", service));
        cmd.Parameters.Add(param.stringparam("@fee", fee));
        cmd.Parameters.Add(param.stringparam("@agent_association_details", agent_association_details));
        cmd.Parameters.Add(param.stringparam("@referral_origin_countries", referral_origin_countries));
        cmd.Parameters.Add(param.stringparam("@staff_update_plan", staff_update_plan));
        cmd.Parameters.Add(param.stringparam("@partner_institution_details", partner_institution_details));
        cmd.Parameters.Add(param.stringparam("@contact_person_name_number", contact_person_name_number));
        cmd.Parameters.Add(param.stringparam("@contact_person_email", contact_person_email));
        cmd.Parameters.Add(param.stringparam("@full_name", full_name));
        cmd.Parameters.Add(param.stringparam("@position", position));
        cmd.Parameters.Add(param.stringparam("@signature", signature));
        cmd.Parameters.Add(param.datetimeparam("@signature_date", signature_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd); // Assuming ExtQueryDS executes the stored procedure and returns DataSet
    }

    public static DataSet ins_interview_form(string name, string dob, string phone, string email, string std_id, string interested_course, string hope_from_course, string career_goal, string past_course, string course_experience, string learning_style, string sel_learning_style, string learning_material, string learning_material_other, string support_for_course, string other_support, string currently_working, string workspace, string updated_cv, string worked_in_industry, string role, string applying_rpl, string other_information, string completed_course, string transcripts, string regular_access, string solution_and_strategy, string approx_computer_use, string digital_literacy, string discuss_solution, string score, string login_pc, string send_email, string navigate_website, string create_folder, string find_information, string attach_document, string save_emails, string login_on_system, string use_social_media, string candidate_suitable, string additional_information, string details, string additional_support, string contain_online_component, string comments, string suitable_for_enrolment, string staff_name, string position, string signature, string signature_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_course_entry_form_sp";
        cmd.CommandType = CommandType.StoredProcedure;

        // Create an instance of the Parameter class
        parameter param = new parameter();

        // Add parameters using the Parameter class
        cmd.Parameters.Add(param.stringparam("@name", name));
        cmd.Parameters.Add(param.stringparam("@dob", dob));
        cmd.Parameters.Add(param.stringparam("@phone", phone));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@std_id", std_id));
        cmd.Parameters.Add(param.stringparam("@interested_course", interested_course));
        cmd.Parameters.Add(param.stringparam("@hope_from_course", hope_from_course));
        cmd.Parameters.Add(param.stringparam("@career_goal", career_goal));
        cmd.Parameters.Add(param.stringparam("@past_course", past_course));
        cmd.Parameters.Add(param.stringparam("@course_experience", course_experience));
        cmd.Parameters.Add(param.stringparam("@learning_style", learning_style));
        cmd.Parameters.Add(param.stringparam("@sel_learning_style", sel_learning_style));
        cmd.Parameters.Add(param.stringparam("@learning_material", learning_material));
        cmd.Parameters.Add(param.stringparam("@learning_material_other", learning_material_other));
        cmd.Parameters.Add(param.stringparam("@support_for_course", support_for_course));
        cmd.Parameters.Add(param.stringparam("@other_support", other_support));
        cmd.Parameters.Add(param.boolparam("@currently_working", currently_working));
        cmd.Parameters.Add(param.stringparam("@workspace", workspace));
        cmd.Parameters.Add(param.stringparam("@updated_cv", updated_cv));
        cmd.Parameters.Add(param.boolparam("@worked_in_industry", worked_in_industry));
        cmd.Parameters.Add(param.stringparam("@role", role));
        cmd.Parameters.Add(param.boolparam("@applying_rpl", applying_rpl)); // Assuming applying_rpl 
        cmd.Parameters.Add(param.stringparam("@other_information", other_information));
        cmd.Parameters.Add(param.boolparam("@completed_course", completed_course)); // Assuming completed_course 
        cmd.Parameters.Add(param.stringparam("@transcripts", transcripts));
        cmd.Parameters.Add(param.boolparam("@regular_access", regular_access)); // Assuming regular_access 
        cmd.Parameters.Add(param.stringparam("@solution_and_strategy", solution_and_strategy));
        cmd.Parameters.Add(param.stringparam("@approx_computer_use", approx_computer_use));
        cmd.Parameters.Add(param.boolparam("@digital_literacy", digital_literacy)); // Assuming digital_literacy 
        cmd.Parameters.Add(param.stringparam("@discuss_solution", discuss_solution));
        cmd.Parameters.Add(param.stringparam("@score", score));
        cmd.Parameters.Add(param.stringparam("@login_pc", login_pc));
        cmd.Parameters.Add(param.stringparam("@send_email", send_email));
        cmd.Parameters.Add(param.stringparam("@navigate_website", navigate_website));
        cmd.Parameters.Add(param.stringparam("@create_folder", create_folder));
        cmd.Parameters.Add(param.stringparam("@find_information", find_information));
        cmd.Parameters.Add(param.stringparam("@attach_document", attach_document));
        cmd.Parameters.Add(param.stringparam("@save_emails", save_emails));
        cmd.Parameters.Add(param.stringparam("@login_on_system", login_on_system));
        cmd.Parameters.Add(param.stringparam("@use_social_media", use_social_media));
        cmd.Parameters.Add(param.boolparam("@candidate_suitable", candidate_suitable)); // Assuming candidate_suitable 
        cmd.Parameters.Add(param.boolparam("@additional_information", additional_information)); // Assuming candidate_suitable 
        cmd.Parameters.Add(param.stringparam("@details", details));
        cmd.Parameters.Add(param.stringparam("@additional_support", additional_support));
        cmd.Parameters.Add(param.boolparam("@contain_online_component", contain_online_component)); // Assuming contain_online_component 
        cmd.Parameters.Add(param.stringparam("@comments", comments));
        cmd.Parameters.Add(param.stringparam("@suitable_for_enrolment", suitable_for_enrolment));
        cmd.Parameters.Add(param.stringparam("@staff_name", staff_name));
        cmd.Parameters.Add(param.stringparam("@position", position));
        cmd.Parameters.Add(param.stringparam("@signature", signature));
        cmd.Parameters.Add(param.datetimeparam("@signature_date", signature_date));
        return command.ExtQueryDS(cmd); // Assuming Command.ExecuteDS executes the command and returns a DataSet
    }

    public static DataSet print_course_entry_form(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "print_course_entry_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@stu_id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_course_entry_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_course_entry_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet dis_country()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_country_sp";
        return command.ExtQueryDS(cmd);
    }

    public static DataSet ins_student_request(
    string title, string first_name, string last_name, string gender, string student_id,
    string register_date, string residentia_address, string residentia_suburb,
    string residentia_postcode, string mailing_address, string mailing_suburb,
    string mailing_postcode, string email, string country_code, string contact_no,
    string request, string detail, string documents, string student_signature,
    string sign_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_student_request_forms_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@title", title));
        cmd.Parameters.Add(param.stringparam("@first_name", first_name));
        cmd.Parameters.Add(param.stringparam("@last_name", last_name));
        cmd.Parameters.Add(param.stringparam("@gender", gender));
        cmd.Parameters.Add(param.stringparam("@student_id", student_id));
        cmd.Parameters.Add(param.datetimeparam("@register_date", register_date));
        cmd.Parameters.Add(param.stringparam("@residentia_adress", residentia_address));
        cmd.Parameters.Add(param.stringparam("@residentia_suburb", residentia_suburb));
        cmd.Parameters.Add(param.stringparam("@residentia_postcode", residentia_postcode));
        cmd.Parameters.Add(param.stringparam("@mailing_adress", mailing_address));
        cmd.Parameters.Add(param.stringparam("@mailing_suburb", mailing_suburb));
        cmd.Parameters.Add(param.stringparam("@mailing_postcode", mailing_postcode));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", country_code));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@request", request));
        cmd.Parameters.Add(param.stringparam("@detail", detail));
        cmd.Parameters.Add(param.stringparam("@documents", documents));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.datetimeparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }

    public static DataSet ins_change_course_form(string student_name, string std_id, string country, string passport_no, string dob, string course_enrolled, string intake, string address, string email, string country_code, string contact_no, string change_course, string reason_change_course, string student_signature, string sign_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_change_course_form_sp";
        cmd.CommandType = CommandType.StoredProcedure;
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@student_name", student_name));
        cmd.Parameters.Add(param.stringparam("@std_id", std_id));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.stringparam("@passport_no", passport_no));
        cmd.Parameters.Add(param.stringparam("@dob", dob));
        cmd.Parameters.Add(param.stringparam("@course_enrolled", course_enrolled));
        cmd.Parameters.Add(param.stringparam("@intake", intake));
        cmd.Parameters.Add(param.stringparam("@address", address));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", country_code));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@change_course", change_course));
        cmd.Parameters.Add(param.stringparam("@reason_change_course", reason_change_course));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.stringparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet ins_tbl_new_elicos_orientation_form(string student_full_name, string campus, string student_id_card, string email, string country_code, string contact_no,
    string student_id_no, string aus_address, string overseas_address, string no_emergency, string student_issue, string attendance_week,
    string emergency_no, string problem, string complete_test, string student_sign_name, string student_signature, string create_by)
    {
        // Create a new SqlCommand
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_tbl_new_elicos_orientation_form_sp";  // Stored procedure name
        parameter param = new parameter();

        // Add parameters to the command
        cmd.Parameters.Add(param.stringparam("@student_full_name", student_full_name));
        cmd.Parameters.Add(param.stringparam("@campus", campus));
        cmd.Parameters.Add(param.stringparam("@student_id_card", student_id_card));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", country_code));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@student_id_no", student_id_no));
        cmd.Parameters.Add(param.stringparam("@aus_address", aus_address));
        cmd.Parameters.Add(param.stringparam("@overseas_address", overseas_address));
        cmd.Parameters.Add(param.stringparam("@no_emergency", no_emergency));
        cmd.Parameters.Add(param.stringparam("@student_issue", student_issue));
        cmd.Parameters.Add(param.stringparam("@attendance_week", attendance_week));
        cmd.Parameters.Add(param.stringparam("@emergency_no", emergency_no));
        cmd.Parameters.Add(param.stringparam("@problem", problem));
        cmd.Parameters.Add(param.stringparam("@complete_test", complete_test));
        cmd.Parameters.Add(param.stringparam("@student_sign_name", student_sign_name));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        // Execute the query and return the result as a DataSet
        return command.ExtQueryDS(cmd);
    }


    public static DataSet ins_new_vet_orientation_form_sp(
    string studentfullname,
    string campus,
    string email,
    string qualification,
    string countrycode,
    string contactno,
    string studentidno,
    string photo,
    string ausline1,
    string ausline2,
    string auscit,
    string ausstate,
    string auspostcode,
    string overaddline1,
    string overaddline2,
    string overcit,
    string overcountry,
    string postcode,
    string usino,
    string lateassignment,
    string studentissue,
    string seriousinjury,
    string studentvisa,
    string changecontacttime,
    string specialleave,
    string academicmisconduct,
    string emergencyno,
    string studentdeclaration,
    string explanation,
    string achievements,
    string studentsignature,
    string createby)
    {
        // Create a new SqlCommand object
        SqlCommand cmd = new SqlCommand();

        // Set the name of the stored procedure to be executed
        cmd.CommandText = "ins_new_vet_orientation_form_sp";

        // Initialize the parameter helper class
        parameter param = new parameter();

        // Add the parameters for the stored procedure
        cmd.Parameters.Add(param.stringparam("@studentfullname", studentfullname));
        cmd.Parameters.Add(param.stringparam("@campus", campus));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@qualification", qualification));
        cmd.Parameters.Add(param.stringparam("@countrycode", countrycode));
        cmd.Parameters.Add(param.stringparam("@contactno", contactno));
        cmd.Parameters.Add(param.stringparam("@studentidno", studentidno));
        cmd.Parameters.Add(param.stringparam("@photo", photo));
        cmd.Parameters.Add(param.stringparam("@ausline1", ausline1));
        cmd.Parameters.Add(param.stringparam("@ausline2", ausline2));
        cmd.Parameters.Add(param.stringparam("@auscit", auscit));
        cmd.Parameters.Add(param.stringparam("@ausstate", ausstate));
        cmd.Parameters.Add(param.stringparam("@auspostcode", auspostcode));
        cmd.Parameters.Add(param.stringparam("@overaddline1", overaddline1));
        cmd.Parameters.Add(param.stringparam("@overaddline2", overaddline2));
        cmd.Parameters.Add(param.stringparam("@overcit", overcit));
        cmd.Parameters.Add(param.stringparam("@overcountry", overcountry));
        cmd.Parameters.Add(param.stringparam("@postcode", postcode));
        cmd.Parameters.Add(param.stringparam("@usino", usino));
        cmd.Parameters.Add(param.stringparam("@lateassignment", lateassignment));
        cmd.Parameters.Add(param.stringparam("@studentissue", studentissue));
        cmd.Parameters.Add(param.stringparam("@seriousinjury", seriousinjury));
        cmd.Parameters.Add(param.stringparam("@studentvisa", studentvisa));
        cmd.Parameters.Add(param.stringparam("@changecontacttime", changecontacttime));
        cmd.Parameters.Add(param.stringparam("@specialleave", specialleave));
        cmd.Parameters.Add(param.stringparam("@academicmisconduct", academicmisconduct));
        cmd.Parameters.Add(param.stringparam("@emergencyno", emergencyno));
        cmd.Parameters.Add(param.stringparam("@studentdeclaration", studentdeclaration));
        cmd.Parameters.Add(param.stringparam("@explanation", explanation));
        cmd.Parameters.Add(param.stringparam("@achievements", achievements));
        cmd.Parameters.Add(param.stringparam("@studentsignature", studentsignature));
        cmd.Parameters.Add(param.stringparam("@createby", createby));

        // Execute the query and return the result as a DataSet
        return command.ExtQueryDS(cmd);
    }


    public static DataSet sel_new_vet_orientation_form(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_new_vet_orientation_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet sel_ept_form(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_ept_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet sel_new_elicos_orientation_form(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_new_elicos_orientation_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet sel_gte_form(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_gte_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet sel_student_request_forms(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_student_request_forms_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet sel_application_for_deferment_form(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_application_for_deferment_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet dis_new_vet_orientation_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_new_vet_orientation_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }


    public static DataSet dis_new_elicos_orientation_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_new_elicos_orientation_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet ins_credit_card_auth_form(
    string stu_number, string stu_l_name, string stu_given_name, string stu_full_name,
    string email, string contact_code, string contact, string street_address,
    string address_line2, string country, string city, string state, string zip_code,
    string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_credit_card_auth_form_sp";
        cmd.CommandType = CommandType.StoredProcedure;

        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@stu_number", stu_number));
        cmd.Parameters.Add(param.stringparam("@stu_l_name", stu_l_name));
        cmd.Parameters.Add(param.stringparam("@stu_given_name", stu_given_name));
        cmd.Parameters.Add(param.stringparam("@stu_full_name", stu_full_name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@contact_code", contact_code));
        cmd.Parameters.Add(param.stringparam("@contact", contact));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@address_line2", address_line2));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.stringparam("@city", city));
        cmd.Parameters.Add(param.stringparam("@state", state));
        cmd.Parameters.Add(param.stringparam("@zip_code", zip_code));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }


    public static DataSet ins_academic_history(string form_id, string course, string institution, string institution_year, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_academic_history_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@form_id", form_id));
        cmd.Parameters.Add(param.stringparam("@course", course));
        cmd.Parameters.Add(param.stringparam("@institution", institution));
        cmd.Parameters.Add(param.stringparam("@institution_year", institution_year));
        cmd.Parameters.Add(param.stringparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }

    public static DataSet ins_ept_test_form(
    string f_name, string l_name, string email, string std_id_number, string nationality, string date_of_birth,
    string passport_no, string stu_signature, string rb_1_from_france, string rb_2_how_old, string rb_3_where,
    string rb_4_windows, string rb_5_man_over, string rb_6_how_many_student, string rb_7_name_peter, string rb_8_artist,
    string rb_9_20_desks, string rb_10_romantic_films, string rb_11_right_now, string rb_12_at_school,
    string rb_13_piece_of_cake, string rb_14_living_room, string rb_15_meat, string rb_16_buses_late,
    string rb_17_to_restaurant, string rb_18_shopping, string rb_19_in_the_park, string rb_20_seen_fireworks,
    string rb_21_many_years, string rb_22_as_soon_as, string rb_23_lots_of_tourists, string rb_24_to_speak,
    string rb_25_to_cinema, string rb_26_wasnt_interested, string rb_27_iam_afraid, string rb_28_got_driver_licence,
    string rb_29_a_little, string rb_30_on_the_baby, string rb_31_these_little_things, string rb_32_ran_into_cofee,
    string rb_33_he_won, string rb_34_to_jane, string rb_35_is_dinner, string rb_36_the_flight, string rb_37_on_the_A2,
    string rb_38_takes_place, string rb_39_in_the_fight, string rb_40_part_of_city,
    string about_article, string advantage_eng_learning, string advantage_stay_country, string time_money_resourse,
    string max_opportunity_for_english, string advantage_learn_eng_in_country, string learn_english_differ_method,
    string why_choose_study_english, string summary_of_passage, string who_is_gabi, string fiona_actress,
    string where_gabi_boss, string where_fiona_now, string fiona_second_operation, string fiona_mobile_number_is,
    string what_happened_to_fiona, string recorded_audio, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_ept_test_form_sp";
        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@f_name", f_name));
        cmd.Parameters.Add(param.stringparam("@l_name", l_name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@std_id_number", std_id_number));
        cmd.Parameters.Add(param.stringparam("@nationality", nationality));
        cmd.Parameters.Add(param.stringparam("@date_of_birth", date_of_birth));
        cmd.Parameters.Add(param.stringparam("@passport_no", passport_no));
        cmd.Parameters.Add(param.stringparam("@stu_signature", stu_signature));

        cmd.Parameters.Add(param.stringparam("@rb_1_from_france", rb_1_from_france));
        cmd.Parameters.Add(param.stringparam("@rb_2_how_old", rb_2_how_old));
        cmd.Parameters.Add(param.stringparam("@rb_3_where", rb_3_where));
        cmd.Parameters.Add(param.stringparam("@rb_4_windows", rb_4_windows));
        cmd.Parameters.Add(param.stringparam("@rb_5_man_over", rb_5_man_over));
        cmd.Parameters.Add(param.stringparam("@rb_6_how_many_student", rb_6_how_many_student));
        cmd.Parameters.Add(param.stringparam("@rb_7_name_peter", rb_7_name_peter));
        cmd.Parameters.Add(param.stringparam("@rb_8_artist", rb_8_artist));
        cmd.Parameters.Add(param.stringparam("@rb_9_20_desks", rb_9_20_desks));
        cmd.Parameters.Add(param.stringparam("@rb_10_romantic_films", rb_10_romantic_films));
        cmd.Parameters.Add(param.stringparam("@rb_11_right_now", rb_11_right_now));
        cmd.Parameters.Add(param.stringparam("@rb_12_at_school", rb_12_at_school));
        cmd.Parameters.Add(param.stringparam("@rb_13_piece_of_cake", rb_13_piece_of_cake));
        cmd.Parameters.Add(param.stringparam("@rb_14_living_room", rb_14_living_room));
        cmd.Parameters.Add(param.stringparam("@rb_15_meat", rb_15_meat));
        cmd.Parameters.Add(param.stringparam("@rb_16_buses_late", rb_16_buses_late));
        cmd.Parameters.Add(param.stringparam("@rb_17_to_restaurant", rb_17_to_restaurant));
        cmd.Parameters.Add(param.stringparam("@rb_18_shopping", rb_18_shopping));
        cmd.Parameters.Add(param.stringparam("@rb_19_in_the_park", rb_19_in_the_park));
        cmd.Parameters.Add(param.stringparam("@rb_20_seen_fireworks", rb_20_seen_fireworks));
        cmd.Parameters.Add(param.stringparam("@rb_21_many_years", rb_21_many_years));
        cmd.Parameters.Add(param.stringparam("@rb_22_as_soon_as", rb_22_as_soon_as));
        cmd.Parameters.Add(param.stringparam("@rb_23_lots_of_tourists", rb_23_lots_of_tourists));
        cmd.Parameters.Add(param.stringparam("@rb_24_to_speak", rb_24_to_speak));
        cmd.Parameters.Add(param.stringparam("@rb_25_to_cinema", rb_25_to_cinema));
        cmd.Parameters.Add(param.stringparam("@rb_26_wasnt_interested", rb_26_wasnt_interested));
        cmd.Parameters.Add(param.stringparam("@rb_27_iam_afraid", rb_27_iam_afraid));
        cmd.Parameters.Add(param.stringparam("@rb_28_got_driver_licence", rb_28_got_driver_licence));
        cmd.Parameters.Add(param.stringparam("@rb_29_a_little", rb_29_a_little));
        cmd.Parameters.Add(param.stringparam("@rb_30_on_the_baby", rb_30_on_the_baby));
        cmd.Parameters.Add(param.stringparam("@rb_31_these_little_things", rb_31_these_little_things));
        cmd.Parameters.Add(param.stringparam("@rb_32_ran_into_cofee", rb_32_ran_into_cofee));
        cmd.Parameters.Add(param.stringparam("@rb_33_he_won", rb_33_he_won));
        cmd.Parameters.Add(param.stringparam("@rb_34_to_jane", rb_34_to_jane));
        cmd.Parameters.Add(param.stringparam("@rb_35_is_dinner", rb_35_is_dinner));
        cmd.Parameters.Add(param.stringparam("@rb_36_the_flight", rb_36_the_flight));
        cmd.Parameters.Add(param.stringparam("@rb_37_on_the_A2", rb_37_on_the_A2));
        cmd.Parameters.Add(param.stringparam("@rb_38_takes_place", rb_38_takes_place));
        cmd.Parameters.Add(param.stringparam("@rb_39_in_the_fight", rb_39_in_the_fight));
        cmd.Parameters.Add(param.stringparam("@rb_40_part_of_city", rb_40_part_of_city));


        cmd.Parameters.Add(param.stringparam("@about_article", about_article));
        cmd.Parameters.Add(param.stringparam("@advantage_eng_learning", advantage_eng_learning));
        cmd.Parameters.Add(param.stringparam("@advantage_stay_country", advantage_stay_country));
        cmd.Parameters.Add(param.stringparam("@time_money_resourse", time_money_resourse));
        cmd.Parameters.Add(param.stringparam("@max_opportunity_for_english", max_opportunity_for_english));
        cmd.Parameters.Add(param.stringparam("@advantage_learn_eng_in_country", advantage_learn_eng_in_country));
        cmd.Parameters.Add(param.stringparam("@learn_english_differ_method", learn_english_differ_method));
        cmd.Parameters.Add(param.stringparam("@why_choose_study_english", why_choose_study_english));
        cmd.Parameters.Add(param.stringparam("@summary_of_passage", summary_of_passage));
        cmd.Parameters.Add(param.stringparam("@who_is_gabi", who_is_gabi));
        cmd.Parameters.Add(param.stringparam("@fiona_actress", fiona_actress));
        cmd.Parameters.Add(param.stringparam("@where_gabi_boss", where_gabi_boss));
        cmd.Parameters.Add(param.stringparam("@where_fiona_now", where_fiona_now));
        cmd.Parameters.Add(param.stringparam("@fiona_second_operation", fiona_second_operation));
        cmd.Parameters.Add(param.stringparam("@fiona_mobile_number_is", fiona_mobile_number_is));
        cmd.Parameters.Add(param.stringparam("@what_happened_to_fiona", what_happened_to_fiona));
        cmd.Parameters.Add(param.stringparam("@recorded_audio", recorded_audio));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }

    public static DataSet ins_gte_form(string family_name, string given_name, string student_id, string birth_date, string country, string citizenship, string agent_name, string agent_code, string agent_email, string course_selected, string current_add, string marital_status, string family, string family_detail, string health_condition, string health_conditiondetail, string refused_visa_aus, string refused_visa_aus_upd, string refused_visa_aus_detail, string student_visa_other, string student_visa_other_detail, string visited_aus_breached, string doc_evidence_upd, string visited_aus_breached_detail, string apply_admision, string apply_admision_detail, string previous_studied, string previous_studied_detail, string relatives_aus, string relatives_aus_detail, string accommodation_plan, string accommodation_plan_detail, string criminal_record, string criminal_record_detail, string gaps_education, string gaps_education_detail, string undertaken_IELTS, string undertaken_IELTS_upd, string undertaken_IELTS_detail, string plans_intention_study_aus, string type_of_job, string sort_long_term, string expect_learn, string decide_study_aus, string other_course, string nortwest_institute, string livine_expence, string detail_familiy, string lerning_exp, string lerning_exp_detail, string course_relavant, string change_area_study, string work_desc, string work_explain, string planing_while_study, string term_condition, string student_signature, string sign_date, string create_by, string academic_course, string academic_institution, string academic_year, string job_position, string job_company, string job_year)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_gte_form_sp"; // Name of the stored procedure
        parameter param = new parameter();

        // Adding parameters to the command
        cmd.Parameters.Add(param.stringparam("@family_name", family_name));
        cmd.Parameters.Add(param.stringparam("@given_name", given_name));
        cmd.Parameters.Add(param.stringparam("@student_id", student_id));
        cmd.Parameters.Add(param.datetimeparam("@birth_date", birth_date));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.stringparam("@citizenship", citizenship));
        cmd.Parameters.Add(param.stringparam("@agent_name", agent_name));
        cmd.Parameters.Add(param.stringparam("@agent_code", agent_code));
        cmd.Parameters.Add(param.stringparam("@agent_email", agent_email));
        cmd.Parameters.Add(param.stringparam("@course_selected", course_selected));
        cmd.Parameters.Add(param.stringparam("@current_add", current_add));
        cmd.Parameters.Add(param.stringparam("@marital_status", marital_status));
        cmd.Parameters.Add(param.stringparam("@family", family));
        cmd.Parameters.Add(param.stringparam("@family_detail", family_detail));
        cmd.Parameters.Add(param.stringparam("@health_condition", health_condition));
        cmd.Parameters.Add(param.stringparam("@health_conditiondetail", health_conditiondetail));
        cmd.Parameters.Add(param.stringparam("@refused_visa_aus", refused_visa_aus));
        cmd.Parameters.Add(param.stringparam("@refused_visa_aus_upd", refused_visa_aus_upd));
        cmd.Parameters.Add(param.stringparam("@refused_visa_aus_detail", refused_visa_aus_detail));
        cmd.Parameters.Add(param.stringparam("@student_visa_other", student_visa_other));
        cmd.Parameters.Add(param.stringparam("@student_visa_other_detail", student_visa_other_detail));
        cmd.Parameters.Add(param.stringparam("@visited_aus_breached", visited_aus_breached));
        cmd.Parameters.Add(param.stringparam("@doc_evidence_upd", doc_evidence_upd));
        cmd.Parameters.Add(param.stringparam("@visited_aus_breached_detail", visited_aus_breached_detail));
        cmd.Parameters.Add(param.stringparam("@apply_admision", apply_admision));
        cmd.Parameters.Add(param.stringparam("@apply_admision_detail", apply_admision_detail));
        cmd.Parameters.Add(param.stringparam("@previous_studied", previous_studied));
        cmd.Parameters.Add(param.stringparam("@previous_studied_detail", previous_studied_detail));
        cmd.Parameters.Add(param.stringparam("@relatives_aus", relatives_aus));
        cmd.Parameters.Add(param.stringparam("@relatives_aus_detail", relatives_aus_detail));
        cmd.Parameters.Add(param.stringparam("@accommodation_plan", accommodation_plan));
        cmd.Parameters.Add(param.stringparam("@accommodation_plan_detail", accommodation_plan_detail));
        cmd.Parameters.Add(param.stringparam("@criminal_record", criminal_record));
        cmd.Parameters.Add(param.stringparam("@criminal_record_detail", criminal_record_detail));
        cmd.Parameters.Add(param.stringparam("@gaps_education", gaps_education));
        cmd.Parameters.Add(param.stringparam("@gaps_education_detail", gaps_education_detail));
        cmd.Parameters.Add(param.stringparam("@undertaken_IELTS", undertaken_IELTS));
        cmd.Parameters.Add(param.stringparam("@undertaken_IELTS_upd", undertaken_IELTS_upd));
        cmd.Parameters.Add(param.stringparam("@undertaken_IELTS_detail", undertaken_IELTS_detail));
        cmd.Parameters.Add(param.stringparam("@plans_intention_study_aus", plans_intention_study_aus));
        cmd.Parameters.Add(param.stringparam("@type_of_job", type_of_job));
        cmd.Parameters.Add(param.stringparam("@sort_long_term", sort_long_term));
        cmd.Parameters.Add(param.stringparam("@expect_learn", expect_learn));
        cmd.Parameters.Add(param.stringparam("@decide_study_aus", decide_study_aus));
        cmd.Parameters.Add(param.stringparam("@other_course", other_course));
        cmd.Parameters.Add(param.stringparam("@nortwest_institute", nortwest_institute));
        cmd.Parameters.Add(param.stringparam("@livine_expence", livine_expence));
        cmd.Parameters.Add(param.stringparam("@detail_familiy", detail_familiy));
        cmd.Parameters.Add(param.stringparam("@lerning_exp", lerning_exp));
        cmd.Parameters.Add(param.stringparam("@lerning_exp_detail", lerning_exp_detail));
        cmd.Parameters.Add(param.stringparam("@course", course_relavant));
        cmd.Parameters.Add(param.stringparam("@change_area_study", change_area_study));
        cmd.Parameters.Add(param.stringparam("@work_desc", work_desc));
        cmd.Parameters.Add(param.stringparam("@work_explain", work_explain));
        cmd.Parameters.Add(param.stringparam("@planing_while_study", planing_while_study));
        cmd.Parameters.Add(param.stringparam("@term_condition", term_condition));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.datetimeparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        cmd.Parameters.Add(param.stringparam("@academic_course", academic_course));
        cmd.Parameters.Add(param.stringparam("@academic_institution", academic_institution));
        cmd.Parameters.Add(param.stringparam("@academic_year", academic_year));
        cmd.Parameters.Add(param.stringparam("@job_position", job_position));
        cmd.Parameters.Add(param.stringparam("@job_company", job_company));
        cmd.Parameters.Add(param.stringparam("@job_year", job_year));

        return command.ExtQueryDS(cmd);
    }

    public static DataSet ins_refund_form(
        string first_name, string last_name, string birth_date, string nationality, string country_code, string contact_no, string email, string passport_no, string student_address,
        string course_detail, string reason_of_refund, string account_hold_name, string bank_code, string card_number, string bank_name, string account_address, string swift_code,
        string student_name, string student_signature, string sign_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_refund_form_sp";

        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@first_name", first_name));
        cmd.Parameters.Add(param.stringparam("@last_name", last_name));
        cmd.Parameters.Add(param.stringparam("@birth_date", birth_date));
        cmd.Parameters.Add(param.stringparam("@nationality", nationality));
        cmd.Parameters.Add(param.stringparam("@country_code", country_code));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@passport_no", passport_no));
        cmd.Parameters.Add(param.stringparam("@student_address", student_address));
        cmd.Parameters.Add(param.stringparam("@course_detail", course_detail));
        cmd.Parameters.Add(param.stringparam("@reason_of_refund", reason_of_refund));
        cmd.Parameters.Add(param.stringparam("@account_hold_name", account_hold_name));
        cmd.Parameters.Add(param.stringparam("@bank_code", bank_code));
        cmd.Parameters.Add(param.stringparam("@card_number", card_number));
        cmd.Parameters.Add(param.stringparam("@bank_name", bank_name));
        cmd.Parameters.Add(param.stringparam("@account_address", account_address));
        cmd.Parameters.Add(param.stringparam("@swift_code", swift_code));
        cmd.Parameters.Add(param.stringparam("@student_name", student_name));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.stringparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_cricos_student_withdrawal_form(
        string first_name, string last_name, string withdraw_date, string student_id, string current_course, string subsequent_course,
        string reason_for_withdrawal, string student_signature, string sign_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_cricos_student_withdrawal_form_sp";

        // Assuming a custom parameter class to add parameters to the SqlCommand
        parameter param = new parameter();

        // Add parameters for the stored procedure
        cmd.Parameters.Add(param.stringparam("@first_name", first_name));
        cmd.Parameters.Add(param.stringparam("@last_name", last_name));
        cmd.Parameters.Add(param.stringparam("@withdraw_date", withdraw_date));
        cmd.Parameters.Add(param.stringparam("@student_id", student_id));
        cmd.Parameters.Add(param.stringparam("@current_course", current_course));
        cmd.Parameters.Add(param.stringparam("@subsequent_course", subsequent_course));
        cmd.Parameters.Add(param.stringparam("@reason_for_withdrawal", reason_for_withdrawal));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.stringparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        // Call the helper function to execute the query and return the result
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_cancelation_form(string student_no, string student_last_name, string student_given_name, string student_full_name, string email, string countrycode, string contact_no, string street_address, string address_line_2, string city, string state_region, string zip, string country, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_cancelation_form_sp";
        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@student_no", student_no));
        cmd.Parameters.Add(param.stringparam("@student_last_name", student_last_name));
        cmd.Parameters.Add(param.stringparam("@student_given_name", student_given_name));
        cmd.Parameters.Add(param.stringparam("@student_full_name", student_full_name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", countrycode));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@street_address_line_2", address_line_2));
        cmd.Parameters.Add(param.stringparam("@city", city));
        cmd.Parameters.Add(param.stringparam("@state_region", state_region));
        cmd.Parameters.Add(param.stringparam("@zip", zip));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_special_leave_request_form(string student_no, string student_last_name, string student_given_name, string student_full_name, string email, string countrycode, string contact_no, string street_address, string address_line_2, string city, string state_region, string zip, string country, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_special_leave_request_form_sp";
        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@student_no", student_no));
        cmd.Parameters.Add(param.stringparam("@student_last_name", student_last_name));
        cmd.Parameters.Add(param.stringparam("@student_given_name", student_given_name));
        cmd.Parameters.Add(param.stringparam("@student_full_name", student_full_name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", countrycode));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@street_address_line_2", address_line_2));
        cmd.Parameters.Add(param.stringparam("@city", city));
        cmd.Parameters.Add(param.stringparam("@state_region", state_region));
        cmd.Parameters.Add(param.stringparam("@zip", zip));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_student_details_form(string student_no, string student_last_name, string student_given_name, string student_full_name, string email, string countrycode, string contact_no, string street_address, string address_line_2, string city, string state_region, string zip, string country, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_student_details_form_sp";
        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@student_no", student_no));
        cmd.Parameters.Add(param.stringparam("@student_last_name", student_last_name));
        cmd.Parameters.Add(param.stringparam("@student_given_name", student_given_name));
        cmd.Parameters.Add(param.stringparam("@student_full_name", student_full_name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", countrycode));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@street_address_line_2", address_line_2));
        cmd.Parameters.Add(param.stringparam("@city", city));
        cmd.Parameters.Add(param.stringparam("@state_region", state_region));
        cmd.Parameters.Add(param.stringparam("@zip", zip));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_credit_transfer_application(string student_last_name, string title, string student_given_name, string birth_date, string street_address, string postcode, string state_region, string email, string country_code, string contact_no, string student_id, string course_code, string course_title, string application_date, string unit_codes, string unit_titles, string evidence_supplied, string ct_granted, string student_signature, string sign_date, string student_full_name, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_credit_transfer_application_sp";
        cmd.CommandType = CommandType.StoredProcedure;
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@student_last_name", student_last_name));
        cmd.Parameters.Add(param.stringparam("@title", title));
        cmd.Parameters.Add(param.stringparam("@student_given_name", student_given_name));
        cmd.Parameters.Add(param.stringparam("@birth_date", birth_date));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@postcode", postcode));
        cmd.Parameters.Add(param.stringparam("@state_region", state_region));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", country_code));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@student_id", student_id));
        cmd.Parameters.Add(param.stringparam("@course_code", course_code));
        cmd.Parameters.Add(param.stringparam("@course_title", course_title));
        cmd.Parameters.Add(param.datetimeparam("@application_date", application_date));
        cmd.Parameters.Add(param.stringparam("@unit_codes", unit_codes));
        cmd.Parameters.Add(param.stringparam("@unit_titles", unit_titles));
        cmd.Parameters.Add(param.stringparam("@evidence_supplied", evidence_supplied));
        cmd.Parameters.Add(param.stringparam("@ct_granted", ct_granted));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.datetimeparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.stringparam("@student_full_name", student_full_name));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        return command.ExtQueryDS(cmd);
    }


    public static DataSet ins_application_for_reassessment(string student_no, string student_last_name, string student_given_name, string student_full_name, string email, string countrycode, string contact_no, string street_address, string address_line_2, string city, string state_region, string zip, string country, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_application_for_reassessment_sp";
        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@student_no", student_no));
        cmd.Parameters.Add(param.stringparam("@student_last_name", student_last_name));
        cmd.Parameters.Add(param.stringparam("@student_given_name", student_given_name));
        cmd.Parameters.Add(param.stringparam("@student_full_name", student_full_name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", countrycode));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@street_address_line_2", address_line_2));
        cmd.Parameters.Add(param.stringparam("@city", city));
        cmd.Parameters.Add(param.stringparam("@state_region", state_region));
        cmd.Parameters.Add(param.stringparam("@zip", zip));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_appeal_form(string student_no, string student_last_name, string student_given_name, string student_full_name, string email, string countrycode, string contact_no, string street_address, string address_line_2, string city, string state_region, string zip, string country, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_appeal_form_sp";
        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@student_no", student_no));
        cmd.Parameters.Add(param.stringparam("@student_last_name", student_last_name));
        cmd.Parameters.Add(param.stringparam("@student_given_name", student_given_name));
        cmd.Parameters.Add(param.stringparam("@student_full_name", student_full_name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", countrycode));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@street_address_line_2", address_line_2));
        cmd.Parameters.Add(param.stringparam("@city", city));
        cmd.Parameters.Add(param.stringparam("@state_region", state_region));
        cmd.Parameters.Add(param.stringparam("@zip", zip));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_complaint_and_feedback_form(string student_no, string student_last_name, string student_given_name, string student_full_name, string email, string countrycode, string contact_no, string street_address, string address_line_2, string city, string state_region, string zip, string country, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_complaint_and_feedback_form_sp";
        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@student_no", student_no));
        cmd.Parameters.Add(param.stringparam("@student_last_name", student_last_name));
        cmd.Parameters.Add(param.stringparam("@student_given_name", student_given_name));
        cmd.Parameters.Add(param.stringparam("@student_full_name", student_full_name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", countrycode));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@street_address_line_2", address_line_2));
        cmd.Parameters.Add(param.stringparam("@city", city));
        cmd.Parameters.Add(param.stringparam("@state_region", state_region));
        cmd.Parameters.Add(param.stringparam("@zip", zip));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_change_of_campus_form(string std_id, string passport_no, string student_name, string date_of_birth, string street_address, string country_code, string contact_no, string email, string course_enrolled, string intake_date, string change_campus, string current_campus, string course_name, string reason_change_course, string student_signature, string sign_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_change_of_campus_form_sp";
        cmd.CommandType = CommandType.StoredProcedure;

        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@std_id", std_id));
        cmd.Parameters.Add(param.stringparam("@passport_no", passport_no));
        cmd.Parameters.Add(param.stringparam("@student_name", student_name));
        cmd.Parameters.Add(param.stringparam("@date_of_birth", date_of_birth));
        cmd.Parameters.Add(param.stringparam("@street_address", street_address));
        cmd.Parameters.Add(param.stringparam("@country_code", country_code));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@course_enrolled", course_enrolled));
        cmd.Parameters.Add(param.stringparam("@intake_date", intake_date));
        cmd.Parameters.Add(param.stringparam("@change_campus", change_campus));
        cmd.Parameters.Add(param.stringparam("@current_campus", current_campus));
        cmd.Parameters.Add(param.stringparam("@course_name", course_name));
        cmd.Parameters.Add(param.stringparam("@reason_change_course", reason_change_course));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.stringparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }


    public static DataSet ins_application_for_deferment_form(
            string student_name,
            string student_id,
            string birth_date,
            string reason,
            string course,
            string course_start,
            string course_end,
            string deferment_start,
            string deferment_end,
            string student_signature,
            string sign_date,
            string create_by
        )
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_application_for_deferment_form_sp";
        cmd.CommandType = CommandType.StoredProcedure;

        parameter param = new parameter();

        cmd.Parameters.Add(param.stringparam("@student_name", student_name));
        cmd.Parameters.Add(param.stringparam("@student_id", student_id));
        cmd.Parameters.Add(param.stringparam("@birth_date", birth_date));
        cmd.Parameters.Add(param.stringparam("@reason", reason));
        cmd.Parameters.Add(param.stringparam("@course", course));
        cmd.Parameters.Add(param.stringparam("@course_start", course_start));
        cmd.Parameters.Add(param.stringparam("@course_end", course_end));
        cmd.Parameters.Add(param.stringparam("@deferment_start", deferment_start));
        cmd.Parameters.Add(param.stringparam("@deferment_end", deferment_end));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.datetimeparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }

    public static DataSet sel_refund_form(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_refund_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_credit_card_auth_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_credit_card_auth_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_change_course_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_change_course_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_special_leave_request_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_special_leave_request_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_student_detail_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_student_details_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_application_for_reassessment(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_application_for_reassessment_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_cancelation_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_cancelation_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_credit_transfer_application(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_credit_transfer_application_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_appeal_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_appeal_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_complaint_and_feedback_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_complaint_and_feedback_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_change_of_campus_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_change_of_campus_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_cricos_student_withdrawal_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_cricos_student_withdrawal_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_refund_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_refund_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_gte_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_gte_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_ept_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_ept_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_student_request_forms(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_student_request_forms_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_application_for_deferment_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_application_for_deferment_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_all_form_count()
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_all_form_count_sp";
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_release_request_form(string student_name, string std_id, string country, string passport_no, string dob, string course_enrolled, string intake, string address, string email, string country_code, string contact_no, string reason_for_release, string student_signature, string sign_date, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_release_request_form_sp";
        cmd.CommandType = CommandType.StoredProcedure;
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@student_name", student_name));
        cmd.Parameters.Add(param.stringparam("@std_id", std_id));
        cmd.Parameters.Add(param.stringparam("@country", country));
        cmd.Parameters.Add(param.stringparam("@passport_no", passport_no));
        cmd.Parameters.Add(param.stringparam("@dob", dob));
        cmd.Parameters.Add(param.stringparam("@course_enrolled", course_enrolled));
        cmd.Parameters.Add(param.stringparam("@intake", intake));
        cmd.Parameters.Add(param.stringparam("@address", address));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@country_code", country_code));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.stringparam("@reason_for_release", reason_for_release));
        cmd.Parameters.Add(param.stringparam("@student_signature", student_signature));
        cmd.Parameters.Add(param.stringparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_qualification_issuance_form(string student_name, string std_id, string course, string date_request, string documents, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_qualification_issuance_form_sp";

        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@student_name", student_name));
        cmd.Parameters.Add(param.stringparam("@std_id", std_id));
        cmd.Parameters.Add(param.stringparam("@course", course));
        cmd.Parameters.Add(param.stringparam("@date_request", date_request));
        cmd.Parameters.Add(param.stringparam("@documents", documents));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_GST_Form(string visa_type, string visa_from_date, string visa_expiry_date, string job_titles, string job_salaries, string job_start_date, string job_end_date, string job_current, string currently_employed, string highschool, string university, string education_qualificaton, string level_of_study, string study_year, string plan_to_fund, string total_access_fund, string financial_evidance, string has_course_exp, string course_experience, string has_study_gap, string study_gap, string reason_for_australia, string career_goals_australia, string home_country_ties, string australia_family_ties, string post_study_plan, string other_relevant_info, string student_name, string sign_date, string signature_img, string create_by, string has_employee, string complete_highschool, string complete_university)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_GST_Form";
        cmd.CommandType = CommandType.StoredProcedure;

        parameter param = new parameter(); // Assuming you have this helper class

        cmd.Parameters.Add(param.stringparam("@visa_type", visa_type));
        cmd.Parameters.Add(param.stringparam("@visa_from_date", visa_from_date));
        cmd.Parameters.Add(param.stringparam("@visa_expiry_date", visa_expiry_date));
        cmd.Parameters.Add(param.stringparam("@job_titles", job_titles));
        cmd.Parameters.Add(param.stringparam("@job_salaries", job_salaries));
        cmd.Parameters.Add(param.stringparam("@job_start_date", job_start_date));
        cmd.Parameters.Add(param.stringparam("@job_end_date", job_end_date));
        cmd.Parameters.Add(param.stringparam("@job_current", job_current));
        cmd.Parameters.Add(param.stringparam("@currently_employed", currently_employed));
        cmd.Parameters.Add(param.stringparam("@highschool", highschool));
        cmd.Parameters.Add(param.stringparam("@university", university));
        cmd.Parameters.Add(param.stringparam("@education_qualificaton", education_qualificaton));
        cmd.Parameters.Add(param.stringparam("@level_of_study", level_of_study));
        cmd.Parameters.Add(param.stringparam("@study_year", study_year));
        cmd.Parameters.Add(param.stringparam("@plan_to_fund", plan_to_fund));
        cmd.Parameters.Add(param.stringparam("@total_access_fund", total_access_fund));
        cmd.Parameters.Add(param.stringparam("@financial_evidance", financial_evidance));
        cmd.Parameters.Add(param.stringparam("@has_course_exp", has_course_exp));
        cmd.Parameters.Add(param.stringparam("@course_experience", course_experience));
        cmd.Parameters.Add(param.stringparam("@has_study_gap", has_study_gap));
        cmd.Parameters.Add(param.stringparam("@study_gap", study_gap));
        cmd.Parameters.Add(param.stringparam("@reason_for_australia", reason_for_australia));
        cmd.Parameters.Add(param.stringparam("@career_goals_australia", career_goals_australia));
        cmd.Parameters.Add(param.stringparam("@home_country_ties", home_country_ties));
        cmd.Parameters.Add(param.stringparam("@australia_family_ties", australia_family_ties));
        cmd.Parameters.Add(param.stringparam("@post_study_plan", post_study_plan));
        cmd.Parameters.Add(param.stringparam("@other_relevant_info", other_relevant_info));
        cmd.Parameters.Add(param.stringparam("@student_name", student_name));
        cmd.Parameters.Add(param.stringparam("@sign_date", sign_date));
        cmd.Parameters.Add(param.stringparam("@signature_img", signature_img));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        cmd.Parameters.Add(param.stringparam("@has_employee", has_employee));
        cmd.Parameters.Add(param.stringparam("@complete_highschool", complete_highschool));
        cmd.Parameters.Add(param.stringparam("@complete_university", complete_university));

        return command.ExtQueryDS(cmd); // Assuming ExtQueryDS executes the command and returns a DataSet
    }
    public static DataSet dis_release_request_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_release_request_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_qualification_issuance_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_qualification_issuance_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }

    public static DataSet sel_gst_form(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_gst_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_gst_form(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_gst_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet sel_credit_transfer_Report(string id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "sel_credit_transfer_Report_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@id", id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_contact_us_form_sp(string name, string email, string message, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_contact_us_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@name", name));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@message", message));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet dis_contact_us_form_sp(string from_date, string to_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "dis_contact_us_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.datetimeparam("@from_date", from_date));
        cmd.Parameters.Add(param.datetimeparam("@to_date", to_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet print_ack(string test_id)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "print_ack_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.intparam("@test_id", test_id));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_lln_test(string stu_full_name, string std_id, string phone, string email, string qualification, string place_of_test, string dob, string nationality, string passport_number, string passport_copy, string date_of_test, string std_sign,
     string que_1, string ans_1, string que_2, string que_3, string que_4, string que_5, string que_6, string que_7, string que_8, string que_9, string que_10, string que_11, string que_12, string que_13, string que_14, string que_15, string que_16, string que_17, string que_18, string que_19, string que_20, string que_21, string que_22, string que_23, string que_24,
     string std_declaration, string std_cnf_sign, string sign_date)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_lln_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@stu_full_name", stu_full_name));
        cmd.Parameters.Add(param.stringparam("@std_id", std_id));
        cmd.Parameters.Add(param.stringparam("@phone", phone));
        cmd.Parameters.Add(param.stringparam("@email", email));
        cmd.Parameters.Add(param.stringparam("@qualification", qualification));
        cmd.Parameters.Add(param.stringparam("@place_of_test", place_of_test));
        cmd.Parameters.Add(param.datetimeparam("@dob", dob));
        cmd.Parameters.Add(param.stringparam("@nationality", nationality));
        cmd.Parameters.Add(param.stringparam("@passport_number", passport_number));
        cmd.Parameters.Add(param.stringparam("@passport_copy", passport_copy));
        cmd.Parameters.Add(param.datetimeparam("@date_of_test", date_of_test));
        cmd.Parameters.Add(param.stringparam("@std_sign", std_sign));
        cmd.Parameters.Add(param.stringparam("@que_1", que_1));
        cmd.Parameters.Add(param.stringparam("@ans_1", ans_1));
        cmd.Parameters.Add(param.stringparam("@que_2", que_2));
        cmd.Parameters.Add(param.stringparam("@que_3", que_3));
        cmd.Parameters.Add(param.stringparam("@que_4", que_4));
        cmd.Parameters.Add(param.stringparam("@que_5", que_5));
        cmd.Parameters.Add(param.stringparam("@que_6", que_6));
        cmd.Parameters.Add(param.stringparam("@que_7", que_7));
        cmd.Parameters.Add(param.stringparam("@que_8", que_8));
        cmd.Parameters.Add(param.stringparam("@que_9", que_9));
        cmd.Parameters.Add(param.stringparam("@que_10", que_10));
        cmd.Parameters.Add(param.stringparam("@que_11", que_11));
        cmd.Parameters.Add(param.stringparam("@que_12", que_12));
        cmd.Parameters.Add(param.stringparam("@que_13", que_13));
        cmd.Parameters.Add(param.stringparam("@que_14", que_14));
        cmd.Parameters.Add(param.stringparam("@que_15", que_15));
        cmd.Parameters.Add(param.stringparam("@que_16", que_16));
        cmd.Parameters.Add(param.stringparam("@que_17", que_17));
        cmd.Parameters.Add(param.stringparam("@que_18", que_18));
        cmd.Parameters.Add(param.stringparam("@que_19", que_19));
        cmd.Parameters.Add(param.stringparam("@que_20", que_20));
        cmd.Parameters.Add(param.stringparam("@que_21", que_21));
        cmd.Parameters.Add(param.stringparam("@que_22", que_22));
        cmd.Parameters.Add(param.stringparam("@que_23", que_23));
        cmd.Parameters.Add(param.stringparam("@que_24", que_24));
        cmd.Parameters.Add(param.boolparam("@std_declaration", std_declaration));
        cmd.Parameters.Add(param.stringparam("@std_cnf_sign", std_cnf_sign));
        cmd.Parameters.Add(param.datetimeparam("@sign_date", sign_date));
        return command.ExtQueryDS(cmd);
    }
    public static DataSet ins_new_agent_form(string agency_name, string agency_location, string website, string contact_name, string contact_email, string contact_no_code, string contact_no, string create_by)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "ins_new_agent_form_sp";
        parameter param = new parameter();
        cmd.Parameters.Add(param.stringparam("@agency_name", agency_name));
        cmd.Parameters.Add(param.stringparam("@agency_location", agency_location));
        cmd.Parameters.Add(param.stringparam("@website", website));
        cmd.Parameters.Add(param.stringparam("@contact_name", contact_name));
        cmd.Parameters.Add(param.stringparam("@contact_email", contact_email));
        cmd.Parameters.Add(param.stringparam("@contact_no_code", contact_no_code));
        cmd.Parameters.Add(param.stringparam("@contact_no", contact_no));
        cmd.Parameters.Add(param.intparam("@create_by", create_by));

        return command.ExtQueryDS(cmd);
    }
}
