import { Injectable } from '@angular/core';
// import { managers } from './login.model';
import { ApiService } from '../services/api.service';
import { ProxyConfigService } from '../services/proxy.config.service';
import { Headers, Http, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/toPromise';
import { ApiUrl } from '../services/apiUrl.service';

@Injectable()
export class ManagerService {
  private actionUrl: string;
  constructor(private _http: Http, private apiUrl: ApiUrl) {
    this.actionUrl = apiUrl.ApiServer;
  }

  public getAll = (): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/Products")
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }

  public putUsername_Pass = (obj:any): Observable<any> => {
      console.log("obj" +  obj);
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    // let test = new
    return this._http.post(this.actionUrl + "/users"  ,obj, options )
    .map( (response: Response) => <any>response.json()
    )
    .do( 
      x => {
        console.log(x);
     
       
      })
    
  }
  public checkemail = ( obj:any): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/check/email" , obj, options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }
}
  