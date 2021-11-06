import { ComponentFixture, TestBed } from '@angular/core/testing';

import { GestisciPartitaComponent } from './gestisci-partita.component';

describe('GestisciPartitaComponent', () => {
  let component: GestisciPartitaComponent;
  let fixture: ComponentFixture<GestisciPartitaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ GestisciPartitaComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(GestisciPartitaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
