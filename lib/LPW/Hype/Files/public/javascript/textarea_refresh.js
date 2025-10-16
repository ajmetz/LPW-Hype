
function textarea_refresh (form_id, textarea_id) {

    get_updated_text().

    then(

        (update_text_function)  =>  {
                                        document.forms[form_id][textarea_id].value = update_text_function;
                                    }

    ).

    catch(

        (error)                 =>  {
                                        console.error('[textarea_refresh.js] - ERROR: ', error);
                                    }

    );
    
}

async function get_updated_text() {

   const    fetched_text        =   await fetch_text('/text/shoutbox_text.txt');
   return   fetched_text;

}

async function fetch_text (path_to_file) {

    // Initial Values:
    const   options = {

            method              :   'GET',
            credentials         :   'same-origin',
            cache               :   'reload',

    };

    // Processing:
    const   response            =   await fetch(path_to_file, options);
    const   fetched_text        =   await response.text();

    // Output:
    return fetched_text;

}