import { TestBed } from '@angular/core/testing';

import { TorneoAPIService } from './torneo-api.service';

describe('TorneoAPIService', () => {
  let service: TorneoAPIService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TorneoAPIService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
