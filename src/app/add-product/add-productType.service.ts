import { Injectable } from '@angular/core';
import { ApiService } from '../services/api.service';
import { ProxyConfigService } from '../services/proxy.config.service';
import { Headers, Http, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/toPromise';
import { ApiUrl } from '../services/apiUrl.service';


@Injectable()
export class AddProductTypeService {
  private actionUrl: string;
  constructor(private _http: Http, private apiUrl: ApiUrl) {
    this.actionUrl = apiUrl.ApiServer;
  }

  // public getproductAddAmount = (bid): Observable<any[]> =>  {
  //   return this._http.get(this.actionUrl + "/ProductAddAmount/"+ bid)
  //   .map( (response: Response) => <any>response.json() )
  //   .do( x => console.log(x));
  // }
 

public addAmountProduct = (obj:any): Observable<any> => {
  let headers = new Headers({'Content-Type': 'application/json'});
  let options = new RequestOptions({ headers: headers });
  return this._http.put(this.actionUrl + "/add/amountProduct",  obj, options )
  .map( (response: Response) => <any>response.json() )
  .do( x => console.log(x));
}
public getAllProduct = (): Observable<any[]> =>  {
  return this._http.get(this.actionUrl + "/AllProduct")
  .map( (response: Response) => <any>response.json() )
  .do( x => console.log(x));
}


}
export class UpdateService {
  private actionUrl: string;
constructor(private _http: Http, private apiUrl: ApiUrl) {
  this.actionUrl = apiUrl.ApiServer; }

public getAll = (): Observable<any[]> =>  {
  return this._http.get(this.actionUrl + "/ProductTypes")
  .map( (response: Response) => <any>response.json() )
  .do( x => console.log(x));
}


} 




