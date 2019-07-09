using Microsoft.AspNetCore.Mvc;

namespace PalTracker
{
    [Route("/")]
    public class WelcomeController : ControllerBase
    {
        private WelcomeMessage _message {get;set;}

        //[HttpGet]
        // public string SayHello() => "hello";

        public WelcomeController(WelcomeMessage _message){
            this._message = _message;
        }

        [HttpGet]
        public string Environment(){
            return _message.Message;
        }
    }

    

    

    
}