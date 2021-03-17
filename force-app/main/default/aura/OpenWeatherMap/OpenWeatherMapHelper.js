({
    getData : function(cmp) 
    {
        var action = cmp.get('c.OpenWeatherMap');
        action.setCallback(this, $A.getCallback(function (response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                console.log("THIS IS THE CONSOLE LOG METHOD");
                console.log(response.getReturnValue());
                cmp.set('v.response', response.getReturnValue());
            } else if (state === "ERROR") {
                var errors = response.getError();
                console.error(errors);
            }
        }));
        $A.enqueueAction(action);
    }
})