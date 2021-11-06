import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InfoPartitaComponent } from './info-partita.component';

describe('InfoPartitaComponent', () => {
  let component: InfoPartitaComponent;
  let fixture: ComponentFixture<InfoPartitaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ InfoPartitaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(InfoPartitaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
