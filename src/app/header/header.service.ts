import { Injectable } from '@angular/core';
import { Product } from '../product/product.model';
import { ApiService } from '../services/api.service';
import { ProxyConfigService } from '../services/proxy.config.service';
import { Headers, Http, RequestOptions, Response } from '@angular/http';
import { Observable } from 'rxjs/Observable';
import 'rxjs/add/operator/toPromise';
import { ApiUrl } from '../services/apiUrl.service';


@Injectable()
export class HeaderService {
  private actionUrl: string;
  constructor(private _http: Http, private apiUrl: ApiUrl) {
    this.actionUrl = apiUrl.ApiServer;
  }

  public getAll = (bid:any): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/BranchProduct/id2/"+bid)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
  
  public getReservation = (obj:any): Observable<any[]> =>  {
    return this._http.get(this.actionUrl + "/reservation/noti",obj)
    .map( (response: Response) => <any>response.json() )
    .do( x => console.log(x));
  }
 
  
}
