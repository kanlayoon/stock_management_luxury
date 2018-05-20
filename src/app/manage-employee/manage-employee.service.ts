import { Injectable } from '@angular/core';
import { Product } from '../product/product.model';
import { ApiService } from '../services/api.service';
import { ProxyConfigService } from '../services/proxy.config.service';
import { Headers, Http, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/toPromise';
import { ApiUrl } from '../services/apiUrl.service';


@Injectable()
export class manageEmployeeService { 
  private actionUrl: string;
  constructor(private _http: Http, private apiUrl: ApiUrl) {
    this.actionUrl = apiUrl.ApiServer;
  }
  
  public getManager = (): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/Allmanager")
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  public getHeadManager = (): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/Headmanager")
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  public editManger = ( obj:any): Observable<any> => {
    let headers = new Headers({'Content-Type': 'application/json'});
    let options = new RequestOptions({ headers: headers });
    return this._http.put(this.actionUrl + "/edit/manager" , obj, options )
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));   
  }
 

}
