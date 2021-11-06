import { TestBed } from '@angular/core/testing';

import { SocietaApiService } from './societa-api.service';

describe('SocietaApiService', () => {
  let service: SocietaApiService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(SocietaApiService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
