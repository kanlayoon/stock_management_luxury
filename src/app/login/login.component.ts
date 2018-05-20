// import { Component, OnInit } from '@angular/core';
// import { ApiService } from '../services/api.service';
// import { HttpModule } from '@angular/http';
// import { Observable } from 'rxjs/Observable';
// import { Router, ActivatedRoute } from '@angular/router';
 
// import {AuthenticationService } from '../services/Authentication.service';

// @Component({
//   selector: 'login',
//   templateUrl: `./login.component.html`,
//   styleUrls: ['./login.component.css'],
//   providers: [ApiService]
// })
// export class LoginComponent implements OnInit {
//   constructor(private apiservice: ApiService) { }
//   public values: Observable<any[]>;
//   ngOnInit() {
      
//   }

// }
// import { Component, OnInit } from '@angular/core';
// import { Router, ActivatedRoute } from '@angular/router';

// import {  AuthenticationService } from '../services/Authentication.service';
// import { AlertService} from '../services/Alert.service';

// @Component({
//     moduleId: module.id,
//     templateUrl: 'login.component.html'
// })

// export class LoginComponent implements OnInit {
//     model: any = {};
//     loading = false;
//     returnUrl: string;

//     constructor(
//         private route: ActivatedRoute,
//         private router: Router,
//         private authenticationService: AuthenticationService,
//         private alertService: AlertService) { }

//     ngOnInit() {
//         // reset login status
//         this.authenticationService.logout();

//         // get return url from route parameters or default to '/'
//         this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
//     }

//     login() {
//         this.loading = true;
//         this.authenticationService.login(this.model.username, this.model.password)
//             .subscribe(
//                 data => {
//                     this.router.navigate([this.returnUrl]);
//                 },
//                 error => {
//                     this.alertService.error(error);
//                     this.loading = false;
//                 });
//     }
// }
// import { Component, OnInit } from '@angular/core';
// import { Router, ActivatedRoute } from '@angular/router';
 
// import { AlertService, AuthenticationService } from '../login/_services/index';
 
// @Component({
//     moduleId: module.id,
//     templateUrl: 'login.component.html'
// })
 
// export class LoginComponent implements OnInit {
//     model: any = {};
//     loading = false;
//     returnUrl: string;
 
//     constructor(
//         private route: ActivatedRoute,
//         private router: Router,
//         private authenticationService: AuthenticationService,
//         private alertService: AlertService) { }
 
//     ngOnInit() {
//         // reset login status
//         this.authenticationService.logout();
 
//         // get return url from route parameters or default to '/'
//         this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/';
//     }
 
//     login() {
//         this.loading = true;
//         this.authenticationService.login(this.model.username, this.model.password)
//             .subscribe(
//                 data => {
//                     this.router.navigate([this.returnUrl]);
//                 },
//                 error => {
//                     this.alertService.error(error._body);
//                     this.loading = false;
//                 });
//     }
// }

import { AuthService } from './shared/api/auth.service';
import { ProxyConfigService } from './shared/helpers/proxy.config.service';
import { Router, ActivatedRoute, Params } from '@angular/router';
import { ApiAuthService } from './shared/api/api-auth.service';
import { SharedAuthService } from './shared/helpers/shared-auth.service';
import { Component, OnInit, ViewChild ,Inject} from '@angular/core';
import {ManagerService} from './login.service';
import { AuthenticationService } from './_services/authentication.service';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material';

// import { ModalComponent } from 'ng2-bs3-modal/ng2-bs3-modal';
import { Http, Headers, RequestOptions, Response, ResponseContentType, ResponseOptions, ResponseType} from '@angular/http';
@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
  userPass :any;
  manager :any;
  user :any;
  pass :any;
  hide = true;
  constructor( private ManagerService : ManagerService, private _http: Http,public dialog: MatDialog,
    private _sharedAuthService: SharedAuthService,
    private _authService: AuthService,
    private _authenticationService: AuthenticationService,
    private _router: Router,
    private _proxy: ProxyConfigService,
    private route: ActivatedRoute,
    private router: Router) { }
    

  url = '';
  valid = true;
  expired = false;
  sub;
  error = false;
  errorMsg = "";

  ngOnInit() {
    
    this.sub = this.route
      .queryParams
      .subscribe(params => {
        // Defaults to 0 if no query param provided.
        this.url = params['url'];
      });
  }

  ngOnDestroy() {
    this.sub.unsubscribe();
  }

  signIn(username,password): void {
   
      let obj = {
        Username : username,
        Password: btoa(password)
      }  
        this.ManagerService.putUsername_Pass(obj).subscribe( data => {
          this.userPass = data
          localStorage.setItem('currentUser', data.token);
          localStorage.setItem('currentUserStatus', data.status);
        }, 
         error => console.log(error),
        () => console.log("put userPass error"));
        // console.log(this.types);
     }


  // onSubmit(username: string, password: string) {
  //   console.log("username"+ username);
  //   console.log("password" + password);

  //   this._authService.getToken(username, password).subscribe(
  //     (token) => {
  //       if (token) {
  //         this._sharedAuthService.token.next(token);
  //         console.log("token" +   this._sharedAuthService.token.next(token) );
  //         if (this.url) {
  //           this.router.navigate(['/' + this.url]);
  //         } else {
  //           this.router.navigate(['/overview']);
  //         }
  //       }
  //     },
  //     (error) => {
  //       if(error.status == 400){
  //         let errorObj = JSON.parse(error._body);

  //         this.error = true;
  //         this.errorMsg = errorObj.error_description;
  //       }
  //     }
  //   );
  // }
  openDialog(): void {
    let dialogRef = this.dialog.open(emailDialog, {
      width: '250px',
      data: {  }
    });

    dialogRef.afterClosed().subscribe(result => {
      console.log('The dialog was closed');
      //this.animal = result;
    });
  }
  login(){
    let obj = {
      username: this.user,
      password : this.pass
    }

    console.log("user" + this.user);
    console.log("pass" + this.pass)
    this.ManagerService.putUsername_Pass(obj).subscribe(data => {
      this.manager = data;
      console.log("in convert"+this.manager);
      console.log("status"+data.status);
      if( data.message == 'OK' && data.status == 1 ){ 
        console.log("login success");
        localStorage.setItem('currentUser', data.token);
        localStorage.setItem('currentUserStatus', data.status);
        localStorage.setItem('currentUserUsername', data.username);
        //this.router.navigate['/dashboard-head-office'];
        this.router.navigate(['/' + 'dashboard-head-office']);  
      }
      else if( data.message == 'OK' && data.status > 1 ){ 
        console.log("login success");
        localStorage.setItem('currentUser', data.token);
        localStorage.setItem('currentUserStatus', data.status);
        localStorage.setItem('currentUserUsername', data.username);
        //this.router.navigate['/dashboard-head-office'];
        this.router.navigate(['/' + 'dashboard-branch']);  
      }
      
    },error => {console.log(error)
      if(error.status == 401 ||error.OK == "false" ) {
        console.log("respone" + Response.prototype.ok)
        console.log("log in failed");
        document.getElementById("openModalButton").click();
      }
    });  
  }
  clearLocal(){
    localStorage.clear();
    this.router.navigate(['/' + 'login']);
  }

}
@Component({
  selector: 'dialog-overview-example-dialog',
  templateUrl: 'input_email.html',
})
export class emailDialog {
  checkE :any;
  constructor(private ManagerService : ManagerService, private _http: Http,
    public dialogRef: MatDialogRef<emailDialog>,
    @Inject(MAT_DIALOG_DATA) public data: any) { }

  check(data): void {
    console.log("mail" + data.mail);
   
    let obj = {
        email : data.mail
    }
    this.ManagerService.checkemail(obj).subscribe(data => {
      this.checkE = data;
      console.log(data);
      
    },
      error => console.log(error));
    this.dialogRef.close();
    if(data.mail == null){
      document.getElementById("openModalButtonemail").click();
    }
  }

}






